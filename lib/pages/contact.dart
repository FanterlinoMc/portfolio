import 'package:flutter/material.dart';
import 'package:portafolio_ex1/components/skill_chip.dart';
import 'package:portafolio_ex1/components/spacing.dart';

import '../components/textfeilds.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController messageController = TextEditingController();

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Contact",
          style: headlineStyle(context, color: Colors.blue),
        ),
        FanTextfeilds(
          hintText: "Name",
          mainline: 1,
          maxline: 2,
          type: TextInputType.text,
          controller: nameController,
        ),
        FanTextfeilds(
          hintText: "Email",
          mainline: 1,
          maxline: 2,
          type: TextInputType.text,
          controller: emailController,
        ),
        FanTextfeilds(
          hintText: "Message",
          mainline: 1,
          maxline: 2,
          type: TextInputType.text,
          controller: messageController,
        ),
        InkWell(onTap: () {}, child: const SkillChip(label: "Send Message"))
      ],
    );
  }
}
