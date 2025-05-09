import 'package:flutter/material.dart';
import 'dart:async';

class BackGroundPage extends StatefulWidget {
  const BackGroundPage({super.key});

  @override
  _BackGroundPageState createState() => _BackGroundPageState();
}

class _BackGroundPageState extends State<BackGroundPage> with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  // @override
  // void dispose() {
  //   controller1.dispose();
  //   controller2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //bool isScreenWide = MediaQuery.of(context).size.width >= 1200;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: size.height * (animation2.value + .30),
            left: size.width * .21,
            child: CustomPaint(
              painter: MyPainter(50)
            )
          ),
          Positioned(
            top: size.height * 1,
            left: size.width * .1,
            child: CustomPaint(
              painter: MyPainter(animation4.value - 10),
            ),
          ),
          Positioned(
            top: size.height * .7,
            left: size.width * (animation2.value + .7),
            child: CustomPaint(
              painter: MyPainter(60),
            ),
          ),
          // Positioned(
          //   top: size.height * animation3.value,
          //   left: size.width * (animation1.value + .6),
          //   child: CustomPaint(
          //     painter: MyPainter(60),
          //   ),
          // ),
          Positioned(
            top: size.height * .3,
            left: size.width * .9,
            child: CustomPaint(
              painter: MyPainter(animation4.value - 20),
            ),
          ),
        ],
      ),
    );
  }

  // Widget component1(
  //     IconData icon, String hintText, bool isPassword, bool isEmail) {
  //   Size size = MediaQuery.of(context).size;
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(15),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(
  //         sigmaY: 15,
  //         sigmaX: 15,
  //       ),
  //       child: Container(
  //         height: size.width / 8,
  //         width: size.width / 1.2,
  //         alignment: Alignment.center,
  //         padding: EdgeInsets.only(right: size.width / 30),
  //         decoration: BoxDecoration(
  //           color: Colors.white.withOpacity(.05),
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //         child: TextField(
  //           style: TextStyle(color: Colors.white.withOpacity(.8)),
  //           cursorColor: Colors.white,
  //           obscureText: isPassword,
  //           keyboardType:
  //               isEmail ? TextInputType.emailAddress : TextInputType.text,
  //           decoration: InputDecoration(
  //             prefixIcon: Icon(
  //               icon,
  //               color: Colors.white.withOpacity(.7),
  //             ),
  //             border: InputBorder.none,
  //             hintMaxLines: 1,
  //             hintText: hintText,
  //             hintStyle:
  //                 TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget component2(String string, double width, VoidCallback voidCallback) {
  //   Size size = MediaQuery.of(context).size;
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(15),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
  //       child: InkWell(
  //         highlightColor: Colors.transparent,
  //         splashColor: Colors.transparent,
  //         onTap: voidCallback,
  //         child: Container(
  //           height: size.width / 8,
  //           width: size.width / width,
  //           alignment: Alignment.center,
  //           decoration: BoxDecoration(
  //             color: Colors.white.withOpacity(.05),
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: Text(
  //             string,
  //             style: TextStyle(color: Colors.white.withOpacity(.8)),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader =
      const LinearGradient(
              colors: [Color(0xffFD5E3D), Color(0xffC43990)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
