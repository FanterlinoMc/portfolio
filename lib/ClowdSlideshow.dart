import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ClowdSlideshow extends StatefulWidget {
  const ClowdSlideshow({super.key});

  @override
  State<ClowdSlideshow> createState() => _ClowdSlideshowState();
}

class _ClowdSlideshowState extends State<ClowdSlideshow> {
  List<String> image = [
    "assets/clowdchat.png",
    "assets/clowddetails.png",
    "assets/clowdhomefeed.png",
    "assets/clowdlogIng.png",
    "assets/clowdorder.png",
    "assets/clowdprfile.png",
    "assets/clowdreview.png",
    "assets/clowdsearch.png",
    "assets/clowdwelcome.png",
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.8, // 80% of screen height
      child: CarouselSlider(
        items: image
            .map((item) => Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.fitHeight,
                    height: screenHeight * 1, // 70% of screen height
                    width: screenWidth * 0.9, // 90% of screen width
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: screenHeight * 0.9, // 80% of screen height
          viewportFraction: 0.8, // Fraction of the screen width for each slide
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
