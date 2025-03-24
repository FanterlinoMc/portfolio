import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Responsive height spacing
Widget heightSpace(BuildContext context, {double multiplier = 0.4}) {
  // Multiplier determines the fraction of the screen height to use
  return SizedBox(height: MediaQuery.of(context).size.height * multiplier);
}

/// Responsive vertical spacing
Widget space(BuildContext context, {double multiplier = 0.1}) {
  // Multiplier determines the fraction of the screen height to use
  return SizedBox(height: MediaQuery.of(context).size.height * multiplier);
}

/// Responsive text style for body text
TextStyle textStyle(BuildContext context) {
  double fontSize =
      MediaQuery.of(context).size.width * 0.05; // 5% of screen width
  return GoogleFonts.tomorrow(
    wordSpacing: 5,
    height: 1.5,
    color: Colors.white,
    fontSize: fontSize.clamp(18, 25), // Clamp font size between 14 and 24
    fontWeight: FontWeight.w500,
  );
}

/// Responsive text style for inner headers
TextStyle innerHeaderStyle(BuildContext context) {
  double fontSize =
      MediaQuery.of(context).size.width * 0.05; // 5% of screen width
  return GoogleFonts.tomorrow(
    wordSpacing: 5,
    height: 1.5,
    color: Colors.blue,
    fontSize: fontSize.clamp(16, 25), // Clamp font size between 16 and 25
    fontWeight: FontWeight.w600,
  );
}

/// Responsive text style for headlines
TextStyle headlineStyle(BuildContext context, {Color? color}) {
  double fontSize =
      MediaQuery.of(context).size.width * 0.05; // 5% of screen width
  return GoogleFonts.tomorrow(
    wordSpacing: 5,
    height: 1.5,
    color: color ?? Colors.white,
    fontSize: fontSize.clamp(20, 30), // Clamp font size between 20 and 30
    fontWeight: FontWeight.bold,
  );
}

/// Responsive text style for main headings
TextStyle headingTextStyle(BuildContext context) {
  double fontSize =
      MediaQuery.of(context).size.width * 0.08; // 8% of screen width
  return GoogleFonts.tomorrow(
    wordSpacing: 10,
    height: 1.5,
    color: Colors.blue,
    fontSize: fontSize.clamp(25, 50), // Clamp font size between 25 and 50
    fontWeight: FontWeight.bold,
  );
}

/// Responsive text style for experience section
TextStyle experienceStyle(BuildContext context) {
  double fontSize =
      MediaQuery.of(context).size.width * 0.06; // 6% of screen width
  return GoogleFonts.tomorrow(
    wordSpacing: 10,
    height: 1.5,
    color: Colors.white,
    fontSize: fontSize.clamp(18, 28), // Clamp font size between 18 and 28
    fontWeight: FontWeight.w500,
  );
}
