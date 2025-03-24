import 'dart:ui';

import 'package:flutter/material.dart';

class FanTextfeilds extends StatelessWidget {
  // IconData icon;
  late String hintText;
  TextEditingController controller;

  late int? maxline;
  late int? mainline;
  late int? maxlength;
  late TextInputType type;

  // late bool isPassword;
  // late bool isEmail;
  FanTextfeilds({
    Key? key,
    required this.hintText,
    required this.controller,
    this.maxline,
    this.mainline,
    this.maxlength,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isScreenWide = MediaQuery.of(context).size.width >= 1200;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 15,
            sigmaX: 15,
          ),
          child: Container(
            //  height: 60,
            width: isScreenWide ? size.width / 3 : size.width / 1.2,
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: size.width / 30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: type,
                minLines: mainline,
                maxLines: maxline,
                maxLength: maxlength,
                controller: controller,
                style: TextStyle(color: Colors.white.withOpacity(.8)),
                cursorColor: Colors.white,
                // obscureText: isPassword,
                // keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // prefixIcon: Icon(
                  //   icon,
                  //   color: Colors.white.withOpacity(.7),
                  // ),
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 14, color: Colors.white.withOpacity(.5)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
