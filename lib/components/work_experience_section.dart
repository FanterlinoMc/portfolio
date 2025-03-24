import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/components/spacing.dart';

class WorkExperienceSection extends StatelessWidget {
  final GlobalKey workExperienceKey;
  final bool isWidgetVisible;

  const WorkExperienceSection({
    super.key,
    required this.workExperienceKey,
    required this.isWidgetVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Work Experience",
          key: workExperienceKey,
          style: headlineStyle(context),
        )
            .animate(target: isWidgetVisible ? 1 : 0)
            .slideX(begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
      ],
    );
  }
}
