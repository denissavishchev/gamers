import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleBoxSmall extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var colors = Offset.zero & size;
    var colorsInside = Offset.zero & size;
    var pathInside = Path();
    var paintInside = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.5, 0.9, 1],
          colors: [
            Colors.red.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
            Colors.lightBlue.withOpacity(0.1),
            Colors.lightBlueAccent.withOpacity(0.2)
          ]).createShader(colorsInside)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawArc(const Rect.fromLTRB(3, 3, 69, 69), 3 * math.pi / 2, -math.pi * 1.5, false, paintInside);

    canvas.drawPath(pathInside, paintInside);

    var paint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.5, 0.9, 1],
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.4),
            Colors.blueAccent.withOpacity(0.4),
            Colors.lightBlue.withOpacity(0.2)
          ]).createShader(colors)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    canvas.drawArc(const Rect.fromLTRB(0, 0, 72, 72), 3 * math.pi / 2, -math.pi * 1.5, false, paint);
    canvas.drawArc(const Rect.fromLTRB(4, 4, 68, 68), 3 * math.pi / 2, -math.pi * 1.5, false, paint);

    var path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.025, size.width * 0.5, size.height * 0.05)
      ..moveTo(size.width, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.975, size.height * 0.45, size.width * 0.95, size.height * 0.5);

    canvas.drawPath(path, paint);

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}