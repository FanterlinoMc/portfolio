import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/components/spacing.dart';
import 'package:portafolio_ex1/pages/hobbs.dart';

import '../pages/digitalart.dart';

class HobbiesSection extends StatelessWidget {
  final GlobalKey hobbiesKey;
  final bool isWidgetVisible;

  const HobbiesSection({
    super.key,
    required this.hobbiesKey,
    required this.isWidgetVisible,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Column(
      key: hobbiesKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hobbies and Interests",
          style: headlineStyle(context, color: Colors.blue),
        )
            .animate(target: isWidgetVisible ? 1 : 0)
            .slideX(begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
        SizedBox(width: screenWidth, height: 100, child: const HobbsPage()),
        space(context),
        SizedBox(
          height: screenheight * 0.5,
          child: const DigitalArt(),
        )
      ],
    );
  }
}
