import 'package:flutter/material.dart';

import '../components/skill_chip.dart';

class HobbsPage extends StatelessWidget {
  const HobbsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              SkillChip(label: "Digital art"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SkillChip(label: "Reading book"),
              ),
              SkillChip(label: "Exploring new technologies"),
            ],
          ),
        ),
      ],
    );
  }
}
