import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.maxLines, this.overflow, this.style});
  final String text;
  final  int? maxLines;
  final TextStyle? style;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}