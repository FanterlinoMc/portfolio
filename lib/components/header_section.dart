import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/components/spacing.dart';

class HeaderSection extends StatelessWidget {
  final GlobalKey summaryKey;
  final bool isWidgetVisible;

  const HeaderSection({
    super.key,
    required this.summaryKey,
    required this.isWidgetVisible,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          'FANTERLINO DAMAI',
          style: headingTextStyle(context),
        )
            .animate(target: isWidgetVisible ? 1 : 0)
            .slideX(begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
        SizedBox(height: screenHeight * 0.02),
        Text('Software Engineer', style: headlineStyle(context))
            .animate(target: isWidgetVisible ? 1 : 0)
            .slideX(begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
      ],
    );
  }
}
