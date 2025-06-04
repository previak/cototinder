import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:cototinder/data/services/cat_api_service.dart';
import 'package:cototinder/presentation/screens/detail_screen/cat_detail_screen.dart';
import 'package:cototinder/presentation/screens/home_screen/widgets/control_buttons.dart';
import 'package:cototinder/presentation/screens/home_screen/widgets/cat_swipe_card.dart';
import 'package:cototinder/presentation/screens/liked_cats_screen/liked_cats_screen.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';
import 'package:cototinder/locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final CatApiService _catService;
  final CardSwiperController _swiperController = CardSwiperController();
  late Future<List<CatBreed>> _futureBreeds;
  List<CatBreed> _breeds = [];
  final int _currentCardIndex = 0;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _catService = getIt<CatApiService>(); // Получаем сервис из локатора
    _futureBreeds = Future.value([]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadInitialBreeds();
  }

  Future<void> _loadInitialBreeds() async {
    try {
      setState(() {
        _isLoadingMore = true;
        _futureBreeds = _catService.fetchRandomCatBreeds();
      });

      final newBreeds = await _futureBreeds;

      if (mounted) {
        setState(() {
          _breeds = newBreeds;
          _swiperController.moveTo(0);
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingMore = false);
        _showErrorDialog(e);
      }
    }
  }

  Future<void> _loadMoreBreeds() async {
    if (_isLoadingMore || !mounted) return;
    setState(() => _isLoadingMore = true);

    try {
      final newBreeds = await _catService.fetchRandomCatBreeds();
      if (mounted) {
        setState(() {
          _breeds.addAll(newBreeds);
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      _showErrorDialog(e);
      if (mounted) setState(() => _isLoadingMore = false);
    }
  }

  void _showErrorDialog(dynamic error) {
    final context = this.context;
    if (!mounted) return;

    String message;
    if (error is SocketException || error is HttpException) {
      message = 'Проблемы с интернет-соединением\n'
          'Проверьте подключение и попробуйте снова';
    } else {
      message = 'Ошибка: ${error.toString()}';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
          if (error is SocketException || error is HttpException)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _loadInitialBreeds();
              },
              child: const Text('Повторить'),
            ),
        ],
      ),
    );
  }

  bool _handleSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (currentIndex == null || previousIndex >= _breeds.length) return false;

    if (previousIndex < 0 || previousIndex >= _breeds.length) return false;

    if (direction == CardSwiperDirection.right) {
      final likedCat = _breeds[previousIndex].copyWith(
        likedDate: DateTime.now(),
      );
      context.read<LikedCatsCubit>().addLikedCat(likedCat);
    }

    if ((currentIndex) > _breeds.length - 5) {
      _loadMoreBreeds();
    }

    return true;
  }

  void _handleLike() {
    if (_currentCardIndex < _breeds.length) {
      _swiperController.swipe(CardSwiperDirection.right);
    }
  }

  void _handleDislike() {
    if (_currentCardIndex < _breeds.length) {
      _swiperController.swipe(CardSwiperDirection.left);
    }
  }

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
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load cats',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadInitialBreeds,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (_breeds.isEmpty) {
                    return Center(
                      child: Text(
                        'No cats available',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }

                  return Stack(
                    children: [
                      CardSwiper(
                        controller: _swiperController,
                        cardsCount: _breeds.length,
                        onSwipe: _handleSwipe,
                        numberOfCardsDisplayed: 3,
                        backCardOffset: const Offset(0, 0),
                        padding: EdgeInsets.zero,
                        cardBuilder: (context, index, _, __) => CatSwipeCard(
                          breed: _breeds[index],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CatDetailScreen(
                                breed: _breeds[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (_isLoadingMore)
                        const Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          ControlButtons(
            onDislike: _handleDislike,
            onLike: _handleLike,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LikedCatsCubit, List<CatBreed>>(
                  builder: (context, cats) => Text(
                    '${cats.length}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  label: const Text(
                    'Liked',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LikedCatsScreen(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
