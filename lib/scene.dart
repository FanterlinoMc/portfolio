// import 'package:flutter/material.dart';
// import 'package:flutter_3d/flutter_3d.dart';

// class ScenePage extends StatefulWidget {
//   const ScenePage({super.key});

//   @override
//   _ScenePageState createState() => _ScenePageState();
// }

// class _ScenePageState extends State<ScenePage> with TickerProviderStateMixin {
//   late Flutter3dController _controller;
//   late AnimationController _animationController;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = Flutter3dController();
//     _controller.addListener(() {
//       if (_controller.isInitialized) {
//         setState(() {
//           _isInitialized = true;
//         });
//       }
//     });
//     _controller.loadModel('assets/planet.glb');

//     _animationController = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('3D Scene'),
//       ),
//       body: Center(
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/stars_background.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Center(
//               child: _isInitialized
//                   ? AnimatedBuilder(
//                       animation: _animationController,
//                       builder: (context, child) {
//                         _controller.setRotation(
//                           0,
//                           _animationController.value * 360,
//                           0,
//                         );
//                         return Flutter3dView(controller: _controller);
//                       },
//                     )
//                   : CircularProgressIndicator(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
