import 'dart:math';

import 'package:flutter/material.dart';

class FuturisticBackgroundPainter extends CustomPainter {
  final double animation;

  FuturisticBackgroundPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    // Create dark background
    final backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
      backgroundRect,
      Paint()..color = const Color(0xFF0A192F), // Dark blue background
    );

    // Draw floating gradient circles with more separated positions
    final List<Map<String, dynamic>> circles = [
      {
        'position': Offset(size.width * 0.9, size.height * 0.1), // Top right
        'radius': size.width * 0.25,
        'colors': [
          const Color(0xFFFF0000).withOpacity(0.8),
          const Color(0xFFFF4444).withOpacity(0.8),
        ]
      },
      {
        'position': Offset(size.width * 0.1, size.height * 0.5), // Middle left
        'radius': size.width * 0.2,
        'colors': [
          const Color(0xFFFF0000).withOpacity(0.8),
          const Color(0xFFFF4444).withOpacity(0.8),
        ]
      },
      {
        'position':
            Offset(size.width * 0.85, size.height * 0.9), // Bottom right
        'radius': size.width * 0.15,
        'colors': [
          const Color(0xFFFF0000).withOpacity(0.8),
          const Color(0xFFFF4444).withOpacity(0.8),
        ]
      },
    ];

    for (var circle in circles) {
      // Add subtle animation to circles
      final animatedPosition = Offset(
        circle['position'].dx + sin(animation * 2 * pi) * 10,
        circle['position'].dy + cos(animation * 2 * pi) * 10,
      );

      final gradient = RadialGradient(
        colors: circle['colors'],
        center: Alignment.center,
      );

      canvas.drawCircle(
        animatedPosition,
        circle['radius'],
        Paint()
          ..shader = gradient.createShader(Rect.fromCircle(
            center: animatedPosition,
            radius: circle['radius'],
          ))
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 50)
          ..style = PaintingStyle.fill
          ..blendMode = BlendMode.screen,
      );
    }
  }

  @override
  bool shouldRepaint(covariant FuturisticBackgroundPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
