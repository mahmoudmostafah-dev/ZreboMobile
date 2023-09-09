import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    this.textDecoration = TextDecoration.none,
    this.textAlign,
    this.textOverflow,
    this.backgroundColor,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        decoration: textDecoration,
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          backgroundColor: backgroundColor,
          overflow: textOverflow,
        ),
      ),
    );
  }
}
