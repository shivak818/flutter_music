import 'package:flutter/material.dart';
import '../music_player_page.dart';

class CategorySelectionPage extends StatelessWidget {
  final String lyrics;

  CategorySelectionPage({required this.lyrics});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Theme')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Rock'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'rock',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Pop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'pop',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Jazz'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'jazz',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('HipHop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'hiphop',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Classical'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'classical',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Country'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MusicPlayerPage(
                    lyrics: lyrics,
                    theme: 'country',
                  ),
                ),
              );
            },
          ),
          // Add more themes here as needed
        ],
      ),
    );
  }
}
