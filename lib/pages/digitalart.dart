import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class DigitalArt extends StatefulWidget {
  const DigitalArt({super.key});

  @override
  State<DigitalArt> createState() => _DigitalArtState();
}

class _DigitalArtState extends State<DigitalArt> with TickerProviderStateMixin {
  late final AnimationController _controller;
  final List<String> images = [
    'assets/alish.png',
    'assets/Artboard.png',
    'assets/clowdstore.png',
    'assets/clowdStores.png',
    'assets/glow.jpeg',
    'assets/lily.jpeg',
    'assets/bro.jpg',
    'assets/Mo.jpeg',
    'assets/here.jpg',
    'assets/juba.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamically calculate sizes based on screen dimensions
    final photoSize = screenWidth < 600
        ? screenWidth * 0.2
        : screenWidth * 0.1; // 20% of screen width
    final lineHeight = screenHeight * 0.005; // 0.5% of screen height
    final containerHeight = screenHeight * 0.2; // 20% of screen height

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: containerHeight / 1.5,
          width: screenWidth,
          child: Stack(
            children: [
              // Moving line
              Positioned(
                left: 0,
                right: 0,
                top: containerHeight / 2 - lineHeight / 2,
                child: Container(
                  width: screenWidth,
                  height: lineHeight,
                  color: Colors.white,
                ),
              ),
              // Animated photos
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    children: List.generate(images.length, (index) {
                      final position =
                          (_controller.value + (index / images.length)) % 1.0;
                      return Positioned(
                        left: position * constraints.maxWidth * 3,
                        top: containerHeight / 2 - photoSize / 2,
                        child: ExtendedImage.asset(
                          images[index],
                          height: photoSize,
                          width: photoSize,
                          fit: BoxFit.cover,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
