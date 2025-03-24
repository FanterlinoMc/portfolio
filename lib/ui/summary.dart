import 'package:flutter/material.dart';

import '../components/experience_item.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExperienceItem(
      company: 'VModel',
      position: 'volunteer Flutter Developer • Remote •',
      duration: '10/11/2022 - 01/20/2023',
summary: [""],
      responsibilities: [
        "Developed core features such as user profile management and booking functionality Designed custom UI components following Material Design guidelines, ensuring a consistent user experience Collaborated with the backend team to integrate RESTful APIs, reducing response time by 35% ",
      ],
    );
  }
}
