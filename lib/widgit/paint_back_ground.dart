import 'package:flutter/cupertino.dart';

class ChatBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 0.65);
    Gradient gradient = LinearGradient(colors: [
      Color(0xFFef1385),
      Color(0xFFf12280),
      Color(0xFFf63d76),
      Color(0xFFf84f80),
    ], stops: [
      0.2,
      0.4,
      0.6,
      0.8,
    ]);
    Paint paint = Paint();
    Path path = Path();
    paint.shader=gradient.createShader(rect);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.65, 0, size.height * 0.3);
    path.lineTo(0, size.height * 0.3);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}