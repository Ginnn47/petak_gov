import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final TextAlign textAlign; // Adding the textAlign parameter
  AppText({
    Key? key,
    this.size = 25,
    required this.text,
    this.color = Colors.black54,
    this.textAlign = TextAlign.justify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.mako(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
