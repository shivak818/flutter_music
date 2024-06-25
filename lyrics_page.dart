import 'package:flutter/material.dart';
import 'category_selection_page.dart'; // Ensure this import is correct

class LyricsPage extends StatefulWidget {
  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  final TextEditingController _lyricsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Lyrics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _lyricsController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your lyrics here',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategorySelectionPage(
                      lyrics: _lyricsController.text,
                    ),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
