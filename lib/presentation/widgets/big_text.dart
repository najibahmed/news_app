
import 'package:flutter/material.dart';


class BigText extends StatelessWidget {
  final Color? color;
  double size;
  final String text;
  TextOverflow overflow;
  BigText({super.key,this.color,required this.text,this.overflow=TextOverflow.ellipsis,this.size=0});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      text,
      maxLines: 2,
      style: TextStyle(
        fontFamily: "Poppins" ,//GoogleFonts.acme().fontFamily,
        fontSize: size==0?20: size,
        color: color?? Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
