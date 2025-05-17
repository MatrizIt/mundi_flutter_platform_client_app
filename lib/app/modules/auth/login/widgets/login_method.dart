import 'package:flutter/material.dart';

class LoginMethod extends StatelessWidget {
  final Color borderColor;
  final String imagePath;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback onPressed;
  const LoginMethod({
    super.key,
    required this.borderColor,
    required this.imagePath,
    required this.onPressed,
    required this.iconHeight,
    required this.iconWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(217, 217, 217, .08),
          border: Border.all(
            color: borderColor,
            width: .5,
          )),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Image.asset(
          imagePath,
          width: iconWidth,
          height: iconHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}