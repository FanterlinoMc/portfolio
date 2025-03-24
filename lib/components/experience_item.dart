import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'spacing.dart';

class ExperienceItem extends StatelessWidget {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;
  final List<String> summary;

  const ExperienceItem({
    super.key,
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes dynamically based on screen width
    final double titleFontSize = screenWidth * 0.05; // 5% of screen width
    final double subtitleFontSize = screenWidth * 0.04; // 4% of screen width
    final double textFontSize = screenWidth * 0.035; // 3.5% of screen width

    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * 0.05,
          bottom: screenHeight * 0.02), // 5% left padding, 2% bottom padding
      child: LayoutBuilder(builder: (context, constraints) {
        final adjustedWidth = constraints.maxWidth > screenWidth * 0.9
            ? screenWidth * 0.5
            : constraints.maxWidth / 1;
        return SizedBox(
          width: adjustedWidth,
          // 90% of screen width
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style:
                            headlineStyle(context, color: Colors.blue).copyWith(
                          fontSize: subtitleFontSize.clamp(
                              20, 25), // Clamp font size between 18
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        position,
                        style: TextStyle(
                          fontSize: subtitleFontSize.clamp(
                              18, 25), // Clamp font size between 18 and 25
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: textFontSize.clamp(
                              16, 22), // Clamp font size between 16 and 22
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.03), // 3% left padding
                    child: Text(
                      "Summary",
                      style: innerHeaderStyle(context).copyWith(
                        fontSize: subtitleFontSize.clamp(
                            18, 25), // Clamp font size between 18 and 25
                      ),
                    ),
                  ),
                  ...summary.map((summary) => Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            bottom: screenHeight *
                                0.01), // 3% left padding, 1% bottom padding
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: summary,
                                      style: GoogleFonts.tomorrow(
                                        wordSpacing: 5,
                                        height: 1.5,
                                        color: Colors.white,
                                        fontSize: textFontSize.clamp(16,
                                            22), // Clamp font size between 16 and 22
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.03), // 3% left padding
                    child: Text(
                      "Responsibilities",
                      style: innerHeaderStyle(context).copyWith(
                        fontSize: subtitleFontSize.clamp(
                            18, 25), // Clamp font size between 18 and 25
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...responsibilities.map((responsibility) => Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            bottom: screenHeight *
                                0.01), // 3% left padding, 1% bottom padding
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: responsibility,
                                      style: GoogleFonts.tomorrow(
                                        wordSpacing: 5,
                                        height: 1.5,
                                        color: Colors.white,
                                        fontSize: textFontSize.clamp(16,
                                            22), // Clamp font size between 16 and 22
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
