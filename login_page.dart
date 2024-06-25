import 'package:flutter/material.dart';
import '../giphy_api.dart';
import 'main.dart';
import 'music_note_painter.dart'; // Ensure this import is correct

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _correctEmail = 'meme123@gmail.com';
  final String _correctPassword = '123456';

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email == _correctEmail && password == _correctPassword) {
      String gifUrl = await GiphyApi.getGifUrl('thumbs up');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    } else {
      String gifUrl = await GiphyApi.getGifUrl('try again');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Invalid email or password.'),
                Image.network(gifUrl),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Try Again'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            // Left half with the custom logo
            Expanded(
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: CustomPaint(
                    size: Size(100, 100),
                    painter: MusicNotePainter(),
                  ),
                ),
              ),
            ),
            // Right half with the login form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
