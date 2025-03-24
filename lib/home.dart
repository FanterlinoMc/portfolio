import 'package:flutter/material.dart';
import 'package:portafolio_ex1/components/header_section.dart';
import 'package:portafolio_ex1/components/hobbies_section.dart';
import 'package:portafolio_ex1/components/professional_summary_section.dart';
import 'package:portafolio_ex1/components/projects_section.dart';
import 'package:portafolio_ex1/components/spacing.dart';
import 'package:portafolio_ex1/components/work_experience_section.dart';
import 'package:portafolio_ex1/pages/second.dart';

import 'pages/contact.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey _summaryKey = GlobalKey();
  final GlobalKey _workExperienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _hobbiesKey = GlobalKey();
  final GlobalKey _projectsKeyCloud = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xff0A1820),
      body: Stack(
        children: [
          const BackGroundPage(),
          Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight *
                      0.02), // 5% left padding, 2% bottom padding
              child: LayoutBuilder(builder: (context, constraints) {
                final adjustedWidth = constraints.maxWidth > screenWidth * 0.9
                    ? screenWidth * 1
                    : constraints.maxWidth / 1;
                return SizedBox(
                  width: adjustedWidth,
                  child: ListView(
                    children: [
                      HeaderSection(
                        summaryKey: _summaryKey,
                        isWidgetVisible: true, // Replace with visibility logic
                      ),
                      ProfessionalSummarySection(
                        summaryKey: _summaryKey,
                        isWidgetVisible: true, // Replace with visibility logic
                      ),
                      screenWidth < 600 ? space(context) : heightSpace(context),
                      WorkExperienceSection(
                        workExperienceKey: _workExperienceKey,
                        isWidgetVisible: true, // Replace with visibility logic
                      ),
                      ProjectsSection(
                        projectsKeyCloud: _projectsKeyCloud,
                        projectsKey: _projectsKey,
                        isWidgetVisible: true, // Replace with visibility logic
                        isSmallScreen: isSmallScreen,
                      ),
                      screenWidth < 600 ? space(context) : heightSpace(context),
                      HobbiesSection(
                        hobbiesKey: _hobbiesKey,
                        isWidgetVisible: true, // Replace with visibility logic
                      ),
                      screenWidth < 600 ? space(context) : heightSpace(context),
                      const Contact(),
                      screenWidth < 600 ? space(context) : heightSpace(context),
                    ],
                  ),
                );
              })),
        ],
      ),
    );
  }
}
