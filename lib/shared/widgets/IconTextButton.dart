import 'package:flutter/material.dart';

class SpecialIconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  SpecialIconTextButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.red,
          ),
          const SizedBox(width: 3), // Optional spacing between icon and text
          Text(text),
        ],
      ),
    );
  }
}
