import 'package:flutter/material.dart';

class MainBox extends CustomPainter {
  final Color color;
  final Color color2;

  MainBox ({required this.color, required this.color2,});

  @override
  void paint(Canvas canvas, Size size) {
    var colors = Offset.zero & size;
    var paint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 0.6],
          colors: [
            color,
            color2
          ]).createShader(colors)
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0
      ..isAntiAlias = true;

    var path = Path()
    ..moveTo(0, size.height * 0.55)
    ..quadraticBezierTo(0, size.height* 0.4, size.width * 0.1, size.height * 0.4)
    ..quadraticBezierTo(size.width * 0.32, size.height * 0.4, size.width * 0.35, size.height * 0.2)
    ..quadraticBezierTo(size.width * 0.37, size.height * 0.05, size.width * 0.5, size.height * 0.05)
    ..lineTo(size.width * 0.9, size.height * 0.05)
    ..quadraticBezierTo(size.width, size.height * 0.05, size.width, size.height * 0.15)
    ..lineTo(size.width, size.height * 0.85)
    ..quadraticBezierTo(size.width, size.height, size.width * 0.85, size.height)
    ..lineTo(size.width * 0.15, size.height)
    ..quadraticBezierTo(0, size.height, 0, size.height * 0.85)
    ..lineTo(0, size.height * 0.55);

    // canvas.drawCircle(Offset(size.width * 0.15, size.height * 0.18), 64, paint);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}