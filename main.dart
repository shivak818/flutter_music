import 'package:flutter/material.dart';
import 'login_page.dart';
import 'search_page.dart';
import 'liked_songs_page.dart';
import 'playlist_page.dart';
import 'lyrics_page.dart'; // Ensure this import is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Liked Songs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LikedSongsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.playlist_play),
              title: Text('My Playlist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaylistPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text('Enter Lyrics Manually'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LyricsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SearchPage(),
    );
  }
}
