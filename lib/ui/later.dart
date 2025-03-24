import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portafolio_ex1/ClowdSlideshow.dart';
import 'package:portafolio_ex1/pages/digitalart.dart';
import 'package:portafolio_ex1/ui/clowdstores.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../VmodelSlideshow.dart';
import '../components/spacing.dart';
import '../pages/hobbs.dart';
import '../pages/second.dart';
import 'vmodel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _summaryKey = GlobalKey();
  final GlobalKey _workExperienceKey = GlobalKey();
  final GlobalKey _vmodelsKey = GlobalKey();
  final GlobalKey _clowdKey = GlobalKey();
  final GlobalKey _hobbies = GlobalKey();

  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Scroll to a specific section
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Check if a widget is visible in the viewport
  bool isWidgetVisible(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return false;

    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final double widgetTop = position.dy;
    final double widgetBottom = widgetTop + box.size.height;

    // Get the screen height
    final double screenHeight = MediaQuery.of(context).size.height;

    // Check if the widget is within the visible viewport
    return widgetBottom > 0 && widgetTop < screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen =
        screenWidth < 600; // Define small screen threshold

    return Scaffold(
      backgroundColor: const Color(0xff0A1820),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: isSmallScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Portfolio",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onSelected: (value) {
                      if (value == "Summary") {
                        scrollToSection(_summaryKey);
                      } else if (value == "Contact") {
                        scrollToSection(_workExperienceKey);
                      } else if (value == "Work Experience") {
                        scrollToSection(_vmodelsKey);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "Summary",
                        child: Text("Summary"),
                      ),
                      const PopupMenuItem(
                        value: "Contact",
                        child: Text("Contact"),
                      ),
                      const PopupMenuItem(
                        value: "Work Experience",
                        child: Text("Work Experience"),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavButton("Summary", _summaryKey),
                  _buildNavButton("Contact", _workExperienceKey),
                  _buildNavButton("Work Experience", _vmodelsKey),
                ],
              ),
      ),
      body: Stack(
        children: [
          const BackGroundPage(),
          WebSmoothScroll(
            controller: _scrollController,
            scrollSpeed: 2.1,
            scrollAnimationLength: 800,
            curve: Curves.easeInOutCirc,
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // 5% of screen width
                vertical: MediaQuery.of(context).size.height *
                    0.02, // 2% of screen height
              ),
              children: [
                _buildHeader(screenWidth, MediaQuery.of(context).size.height,
                    isSmallScreen),
                _buildProfessionalSummary(screenWidth,
                    MediaQuery.of(context).size.height, isSmallScreen),
                _buildWorkExperience(screenWidth,
                    MediaQuery.of(context).size.height, isSmallScreen),
                _buildProjects(screenWidth, MediaQuery.of(context).size.height,
                    isSmallScreen),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build navigation button
  Widget _buildNavButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => scrollToSection(key),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  /// Build header section
  Widget _buildHeader(
      double screenWidth, double screenHeight, bool isSmallScreen) {
    return Column(
      children: [
        Text(
          'FANTERLINO DAMAI',
          style: headingTextStyle(context),
        ).animate(target: isWidgetVisible(_summaryKey) ? 1 : 1).slideX(
              begin: -1.0, // Slide in from the left
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            ),
        SizedBox(height: screenHeight * 0.02), // 2% of screen height
        Text(
          'Software Engineer',
          style: textStyle(context),
        ).animate(target: isWidgetVisible(_summaryKey) ? 1 : 1).slideX(
              begin: -1.0, // Slide in from the left
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            ),
      ],
    );
  }

  /// Build professional summary section
  Widget _buildProfessionalSummary(
      double screenWidth, double screenHeight, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.03), // 3% of screen height
        Text(
          "Professional Summary",
          key: _summaryKey,
          style: textStyle(context),
        ).animate(target: isWidgetVisible(_summaryKey) ? 1 : 1).slideX(
              begin: -1.0, // Slide in from the left
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            ),
        SizedBox(height: screenHeight * 0.02), // 2% of screen height
        Text(
          "Passionate Flutter Developer currently based in Cairo. Transitioned from Cairo University to pursue software development, building Cloud Storez as a hands-on learning project. Driven by the belief that “everything we can imagine is real” (Pablo Picasso). Adept at leveraging AI tools (e.g., GitHub Copilot, ChatGPT) to accelerate development workflows and optimize code quality. Skilled at transforming ideas into functional, user-oriented applications. Adapted to change, flexible in details, and resilient in achieving the end goal and mission.",
          style: textStyle(context),
        ).animate(target: isWidgetVisible(_summaryKey) ? 1 : 1).slideX(
              begin: -1.0, // Slide in from the left
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            ),
      ],
    );
  }

  /// Build work experience section
  Widget _buildWorkExperience(
      double screenWidth, double screenHeight, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(context), // 3% of screen height
        Text(
          "Work Experience",
          key: _workExperienceKey,
          style: headlineStyle(context),
        ).animate(target: isWidgetVisible(_workExperienceKey) ? 1 : 0).slideX(
              begin: -1.0, // Slide in from the left
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            ),
      ],
    );
  }

  /// Build projects section
  Widget _buildProjects(
      double screenWidth, double screenHeight, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.09), // 3% of screen height
        isSmallScreen
            ? Column(
                key: _vmodelsKey,
                children: [
                  SizedBox(
                    width: screenWidth * 1, // 90% of screen width
                    height: screenHeight * 0.4, // 40% of screen height
                    child: const VmodelSlideshow(),
                  )
                      .animate(target: isWidgetVisible(_vmodelsKey) ? 1 : 0)
                      .slideX(
                        begin: -5.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                  SizedBox(height: screenHeight * 0.02),
                  const Vmodel()
                ],
              )
            : Row(
                key: _vmodelsKey,
                children: [
                  SizedBox(
                    width: screenWidth * 0.30, // 30% of screen width
                    height: screenHeight * 1, // Full height
                    child: const VmodelSlideshow(),
                  )
                      .animate(target: isWidgetVisible(_vmodelsKey) ? 1 : 0)
                      .slideX(
                        begin: 1.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                  SizedBox(width: screenWidth * 0.05), // 5% of screen width
                  const Vmodel()
                      .animate(target: isWidgetVisible(_vmodelsKey) ? 1 : 0)
                      .slideX(
                        begin: 1.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                ],
              ),
        heightSpace(context),
        isSmallScreen
            ? Column(
                key: _clowdKey,
                children: [
                  SizedBox(
                    width: screenWidth, // 90% of screen width
                    height: screenHeight * 0.4, // 40% of screen height
                    child: const ClowdSlideshow(),
                  ).animate(target: isWidgetVisible(_clowdKey) ? 1 : 0).slideX(
                        begin: -1.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                  SizedBox(height: screenHeight * 0.02),
                  const ClowdStores()
                ],
              )
            : Row(
                key: _clowdKey,
                children: [
                  SizedBox(
                    width: screenWidth * 0.30, // 30% of screen width
                    height: screenHeight * 1, // Full height
                    child: const ClowdSlideshow(),
                  ).animate(target: isWidgetVisible(_clowdKey) ? 1 : 0).slideX(
                        begin: -1.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                  SizedBox(width: screenWidth * 0.05), // 5% of screen width
                  const ClowdStores()
                      .animate(target: isWidgetVisible(_clowdKey) ? 1 : 0)
                      .slideX(
                        begin: 1.0, // Slide in from the left
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      ),
                ],
              ),
        Column(
          key: _hobbies,
          children: [
            Text(
              "hobbies and interests",
              style: headlineStyle(context),
            ).animate(target: isWidgetVisible(_hobbies) ? 1 : 0).slideX(
                  begin: -1.0, // Slide in from the left
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                ),
          ],
        ),

        SizedBox(width: screenWidth, height: 100, child: const HobbsPage()),
        SizedBox(height: screenHeight * 0.03), // 2% of screen height

        SizedBox(height: 700, width: screenWidth, child: const DigitalArt())
      ],
    );
  }
}
