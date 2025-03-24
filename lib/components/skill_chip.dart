import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamically calculate font size and padding based on screen width
    final fontSize = screenWidth * 0.04; // 4% of screen width
    final horizontalPadding = screenWidth * 0.03; // 3% of screen width
    final verticalPadding = screenWidth * 0.015; // 1.5% of screen width

    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize:
              fontSize.clamp(12.0, 18.0), // Clamp font size between 12 and 18
        ),
      ),
      backgroundColor: const Color(0xff0A1820),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.clamp(8.0, 16.0), // Clamp padding values
        vertical: verticalPadding.clamp(4.0, 8.0),
      ),
    );
  }
}
