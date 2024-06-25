import 'dart:convert';
import 'package:http/http.dart' as http;

class GiphyApi {
  static const String _apiKey = '1sjhsHjLdqyES4nfuwlMQiXW01zI1KmT';

  static Future<String> getGifUrl(String query) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=$_apiKey&q=$query&limit=1'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'] != null && data['data'].isNotEmpty) {
          return data['data'][0]['images']['original']['url'];
        } else {
          return 'https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif'; // Default thumbs up GIF
        }
      } else {
        throw Exception('Failed to load GIF');
      }
    } catch (e) {
      return 'https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif'; // Default thumbs up GIF
    }
  }
}
