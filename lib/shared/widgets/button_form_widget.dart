import 'package:flutter/material.dart';

class SpecButtonFormWidget extends StatelessWidget {
  double? width = double.infinity;
  double? radius = 10.0;
  final String text;
  final VoidCallback function;
  Color backGround;

  SpecButtonFormWidget({
    Key? key,
    required this.text,
    required this.function,
    this.width,
    this.radius,
    this.backGround = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(360, 60),
        primary: backGround,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
