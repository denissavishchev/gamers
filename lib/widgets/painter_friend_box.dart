import 'package:flutter/material.dart';

class FriendBox extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xff2c2f48).withOpacity(0.8)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0
      ..isAntiAlias = true;

    var path = Path()
      ..moveTo(0, size.height * 0.8)
      ..cubicTo(0, size.height * 0.6, size.width * 0.025, size.height * 0.75, size.width * 0.07, size.height * 0.78)
      ..cubicTo(size.width * 0.26, size.height * 0.85, size.width * 0.16, 0, size.width * 0.3, size.height * 0.1)
      ..lineTo(size.width * 0.95, size.height * 0.1)
      ..quadraticBezierTo(size.width, size.height * 0.1, size.width, size.height * 0.25)
      ..lineTo(size.width, size.height * 0.9)
      ..quadraticBezierTo(size.width, size.height, size.width * 0.95, size.height)
      ..lineTo(size.width * 0.05, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height * 0.8);


    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}