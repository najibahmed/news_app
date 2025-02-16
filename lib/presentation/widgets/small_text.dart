import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  double size;
  final String text;

  SmallText({super.key, this.color, required this.text, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: size,
        color: color ?? Colors.black54,
      ),
    );
  }
}
