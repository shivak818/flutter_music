import 'package:flutter/material.dart';
import 'spotify_api.dart';
import 'player_page.dart';

class LikedSongsPage extends StatelessWidget {
  static final List<Song> likedSongs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Songs'),
      ),
      body: ListView.builder(
        itemCount: likedSongs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(likedSongs[index].name),
            subtitle: Text(likedSongs[index].artists.join(', ')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(song: likedSongs[index], gifUrl: ''),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
