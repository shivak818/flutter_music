import 'package:flutter/material.dart';

class MusicNotePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define colors
    final playButtonColor = Color.fromARGB(255, 102, 171, 99);

    // Draw play button
    final playPaint = Paint()
      ..color = playButtonColor
      ..style = PaintingStyle.fill;

    final playPath = Path();
    playPath.moveTo(size.width / 2 - 20, size.height / 2 - 20);
    playPath.lineTo(size.width / 2 + 20, size.height / 2);
    playPath.lineTo(size.width / 2 - 20, size.height / 2 + 20);
    playPath.close();
    canvas.drawPath(playPath, playPaint);

    // Draw "speaks!" text
    TextSpan speaksSpan = TextSpan(
      text: 'speaks!',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 220, 54, 54),
      ),
    );
    TextPainter tpSpeaks = TextPainter(
      text: speaksSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tpSpeaks.layout();
    tpSpeaks.paint(
      canvas,
      Offset(size.width / 2 - tpSpeaks.width / 2, size.height / 2 + 30),
    );

    // Draw "When words fail" text
    TextSpan wordsFailSpan = TextSpan(
      text: 'When words fail',
      style: TextStyle(
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
    TextPainter tpWordsFail = TextPainter(
      text: wordsFailSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tpWordsFail.layout();
    tpWordsFail.paint(
      canvas,
      Offset(size.width / 2 - tpWordsFail.width / 2, size.height / 2 - 30 - tpWordsFail.height),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
