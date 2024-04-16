import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task1/core/models/posts_model.dart';

class ApiServices {
  static Future<List<Posts>> fetchPhotos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((data) => Posts.fromJson(data))
            .toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch photos: $e');
    }
  }
}
