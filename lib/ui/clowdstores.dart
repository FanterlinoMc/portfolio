import 'package:flutter/material.dart';

import '../components/experience_item.dart';

class ClowdStores extends StatelessWidget {
  const ClowdStores({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExperienceItem(
      company: 'ClowdStores',
      position: 'Founder and Flutter Developer ',
      duration: '09/01/2020 - 05/20/2022',
      summary: [
        "ClowdStore was founded To help local brands to get more exposure and attract more customers to their businesses online . ClowdStores as a brand of its own, was founded to enable people to Accessing more business online and connecting local brands with Customers, providing exposure and easy accessibility using Google Map to locate the nearest brand providing more options"
      ],
      responsibilities: [
        "•Developed and launched a cross-platform mobile app using Flutter. • Optimized Firebase Firestore database structure, improving data retrieval speed by 40%.• Designed and implemented an authentication system, reducing user sign-in time by 30%. • Integrated Google Maps API for location-based store discovery, boosting customer engagement by 25%"
      ],
    );
  }
}
