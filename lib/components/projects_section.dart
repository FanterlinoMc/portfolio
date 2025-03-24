import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/ClowdSlideshow.dart';
import 'package:portafolio_ex1/VmodelSlideshow.dart';
import 'package:portafolio_ex1/components/spacing.dart';
import 'package:portafolio_ex1/ui/clowdstores.dart';
import 'package:portafolio_ex1/ui/vmodel.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey projectsKey;
  final GlobalKey projectsKeyCloud;
  final bool isWidgetVisible;
  final bool isSmallScreen;

  const ProjectsSection({
    super.key,
    required this.projectsKey,
    required this.projectsKeyCloud,
    required this.isWidgetVisible,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        isSmallScreen
            ? Column(
                key: projectsKey,
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    child: const VmodelSlideshow(),
                  ).animate(target: isWidgetVisible ? 1 : 0).slideX(
                      begin: 1.0, duration: 1000.ms, curve: Curves.easeInOut),
                  SizedBox(height: screenHeight * 0.02),
                  const Vmodel()
                      .animate(target: isWidgetVisible ? 1 : 0)
                      .slideX(
                          begin: -1.0,
                          duration: 1000.ms,
                          curve: Curves.easeInOut),
                ],
              )
            : Row(
                key: projectsKey,
                children: [
                  SizedBox(
                    width: screenWidth * 0.30,
                    height: screenHeight,
                    child: const VmodelSlideshow(),
                  ).animate(target: isWidgetVisible ? 1 : 0).slideX(
                      begin: 1.0, duration: 1000.ms, curve: Curves.easeInOut),
                  SizedBox(width: screenWidth * 0.05),
                  const Vmodel()
                      .animate(target: isWidgetVisible ? 1 : 0)
                      .slideX(
                          begin: -1.0,
                          duration: 1000.ms,
                          curve: Curves.easeInOut),
                ],
              ),
        screenWidth < 600 ? space(context) : heightSpace(context),
        isSmallScreen
            ? Column(
                key: projectsKeyCloud,
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    child: const ClowdSlideshow(),
                  ).animate(target: isWidgetVisible ? 1 : 0).slideX(
                      begin: 1.0, duration: 1000.ms, curve: Curves.easeInOut),
                  SizedBox(height: screenHeight * 0.02),
                  const ClowdStores()
                      .animate(target: isWidgetVisible ? 1 : 0)
                      .slideX(
                          begin: -1.0,
                          duration: 1000.ms,
                          curve: Curves.easeInOut),
                ],
              )
            : Row(
                key: projectsKeyCloud,
                children: [
                  SizedBox(
                    width: screenWidth * 0.30,
                    height: screenHeight,
                    child: const ClowdSlideshow(),
                  ).animate(target: isWidgetVisible ? 1 : 0).slideX(
                      begin: -5.0, duration: 1000.ms, curve: Curves.easeInOut),
                  SizedBox(width: screenWidth * 0.05),
                  const ClowdStores()
                      .animate(target: isWidgetVisible ? 1 : 0)
                      .slideX(
                          begin: -1.0,
                          duration: 1000.ms,
                          curve: Curves.easeInOut),
                ],
              ),
      ],
    );
  }
}
