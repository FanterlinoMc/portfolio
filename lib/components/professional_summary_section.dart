import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/components/spacing.dart';

class ProfessionalSummarySection extends StatelessWidget {
  final GlobalKey summaryKey;
  final bool isWidgetVisible;

  const ProfessionalSummarySection({
    super.key,
    required this.summaryKey,
    required this.isWidgetVisible,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.03,
          right: screenWidth * 0.03,
          bottom: screenHeight * 0.02), // 5% left padding, 2% bottom padding
      child: LayoutBuilder(builder: (context, constraints) {
        final adjustedWidth = constraints.maxWidth > screenWidth * 0.9
            ? screenWidth * 1
            : constraints.maxWidth / 1;
        return SizedBox(
          width: adjustedWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text("Professional Summary",
                      key: summaryKey,
                      style: headlineStyle(context, color: Colors.blue))
                  .animate(target: isWidgetVisible ? 1 : 0)
                  .slideX(
                      begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width:
                    screenWidth < 600 ? screenWidth * 0.9 : screenWidth * 0.6,
                child: Wrap(children: [
                  Text(
                    "Passionate Flutter Developer currently based in Cairo. Transitioned from Cairo University to pursue software development, building Cloud Storez as a hands-on learning project. Driven by the belief that “everything we can imagine is real” (Pablo Picasso). Adept at leveraging AI tools (e.g., GitHub Copilot, ChatGPT) to accelerate development workflows and optimize code quality. Skilled at transforming ideas into functional, user-oriented applications. Adapted to change, flexible in details, and resilient in achieving the end goal and mission.",
                    style: textStyle(context),
                  ).animate(target: isWidgetVisible ? 1 : 0).slideX(
                      begin: -1.0, duration: 1000.ms, curve: Curves.easeInOut),
                ]),
              ),
            ],
          ),
        );
      }),
    );
  }
}
