import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyApi {
  static const String clientId = '89f9ac004d9a4404ad5a31f1ce7d38da';
  static const String clientSecret = '0930510be0c54ac1a0a996dba4ad9dfa';

  static Future<String> _getAccessToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      print('Failed to fetch access token: ${response.statusCode}');
      throw Exception('Failed to fetch access token');
    }
  }

  static Future<List<Song>> searchSongs(String query) async {
    final accessToken = await _getAccessToken();
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/search?q=$query&type=track&limit=10'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Song> songs = (data['tracks']['items'] as List)
          .map((item) => Song.fromJson(item))
          .toList();
      return songs;
    } else {
      throw Exception('Failed to search songs');
    }
  }
}

class Song {
  final String name;
  final List<String> artists;
  final String previewUrl;

  Song({required this.name, required this.artists, required this.previewUrl});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      name: json['name'],
      artists: List<String>.from((json['artists'] as List).map((artist) => artist['name'])),
      previewUrl: json['preview_url'] ?? '',
    );
  }
}
