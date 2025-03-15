import 'package:cototinder/presentation/screens/home_screen/widgets/cat_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:cototinder/data/services/cat_api_service.dart';
import 'package:cototinder/presentation/screens/detail_screen/cat_detail_screen.dart';
import 'package:cototinder/presentation/screens/home_screen/widgets/control_buttons.dart';
import 'package:cototinder/presentation/screens/home_screen/widgets/likes_counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final CatApiService _catService = CatApiService();
  final CardSwiperController _swiperController = CardSwiperController();
  late Future<List<CatBreed>> _futureBreeds;
  final List<CatBreed> _breeds = [];
  int _likesCounter = 0;

  @override
  void initState() {
    super.initState();
    _loadInitialBreeds();
  }

  Future<void> _loadInitialBreeds() async {
    _futureBreeds = _catService.fetchRandomCatBreeds();
    try {
      final breeds = await _futureBreeds;
      if (mounted) {
        setState(() => _breeds.addAll(breeds));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading initial breeds')),
        );
      }
    }
  }

  Future<void> _loadMoreBreeds() async {
    try {
      final newBreeds = await _catService.fetchRandomCatBreeds();
      if (mounted) {
        setState(() => _breeds.addAll(newBreeds));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading more breeds')),
        );
      }
    }
  }

  void _handleSwipe(CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right && mounted) {
      setState(() => _likesCounter++);
    }
  }

  void _handleLike() => _swiperController.swipe(CardSwiperDirection.right);
  void _handleDislike() => _swiperController.swipe(CardSwiperDirection.left);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'purrfect match',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [LikesCounter(likes: _likesCounter)],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<CatBreed>>(
                future: _futureBreeds,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }
                  if (snapshot.hasError || _breeds.isEmpty) {
                    return Center(
                      child: Text(
                        'Failed to load cats',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }
                  return CardSwiper(
                    controller: _swiperController,
                    cardsCount: _breeds.length,
                    onSwipe: (prevIndex, curIndex, direction) {
                      _handleSwipe(direction);
                      if (curIndex! > _breeds.length - 5) _loadMoreBreeds();
                      return true;
                    },
                    cardBuilder: (context, index, _, __) => CatSwipeCard(
                      breed: _breeds[index],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CatDetailScreen(breed: _breeds[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ControlButtons(
            onDislike: _handleDislike,
            onLike: _handleLike,
          ),
        ],
      ),
    );
  }
}
