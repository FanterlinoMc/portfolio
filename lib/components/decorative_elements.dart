import 'package:flutter/material.dart';

class DecorativeElements extends StatelessWidget {
  const DecorativeElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Plant in top right
        // Positioned(
        // right: 40,
        // top: 40,
        // child: Icon(
        // Icons.local_florist,
        // size: 40,
        // color: Colors.green.withOpacity(0.6),
        // ),
        // ),
        // Framed posters/pictures
        Positioned(
          left: 40,
          top: 80,
          child: Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.3), width: 2),
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          left: 120,
          top: 60,
          child: Container(
            width: 70,
            height: 90,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.3), width: 2),
              borderRadius: BorderRadius.circular(4),
              color: Colors.red.withOpacity(0.2),
            ),
          ),
        ),
        // Small decorative icons
        // Positioned(
        // right: 100,
        // top: 120,
        // child: Icon(
        // Icons.music_note,
        // size: 30,
        // color: Colors.white.withOpacity(0.4),
        // ),
        // ),
      ],
    );
  }
}
