import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VmodelSlideshow extends StatefulWidget {
  const VmodelSlideshow({super.key});

  @override
  State<VmodelSlideshow> createState() => _VmodelSlideshowState();
}

class _VmodelSlideshowState extends State<VmodelSlideshow> {
  List<String> image = [
    "assets/vmodeldiscover.png",
    "assets/vmodellives.png",
    "assets/vmodelprofile.png",
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
