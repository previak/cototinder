import 'dart:convert';
import 'package:cototinder/config/constants.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  Future<List<CatBreed>> fetchRandomCatBreeds() async {
    final response = await http.get(
      Uri.parse(
          '${AppConstants.baseUrl}/images/search?has_breeds=true&limit=10'),
      headers: {'x-api-key': AppConstants.apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) {
        return CatBreed(
          id: item['id'],
          imageUrl: item['url'],
          breedName: item['breeds'][0]['name'],
          description:
              item['breeds'][0]['description'] ?? 'No description available',
        );
      }).toList();
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}
