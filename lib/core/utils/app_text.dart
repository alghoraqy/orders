import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final Color? decorationColor;

  const AppText(
    this.text, {
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.color = Colors.black,
    this.overflow,
    this.maxLines,
    this.height,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontFamily: fontFamily ?? (AppFontFamilies.cairo),
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing,
        decorationColor: decorationColor,
      ),
    );
  }
}

class AppFontFamilies {
  // static const String rubik = 'Rubik';
  static const String cairo = 'Cairo';
}
