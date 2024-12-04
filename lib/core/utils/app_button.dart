import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders/core/constants/app_colors.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? icon;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? side;
  final double? width;
  final Color? textColor;
  final double? fontSize;
  final double? elevation;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? disabledBackgroundColor;
  final Color? shadowColor;
  final Color? decorationColor;
  final bool isIconAfter;
  const AppButton({
    required this.title,
    required this.onPressed,
    this.icon,
    this.radius = 10,
    this.padding,
    this.textDecoration,
    this.margin,
    this.shadowColor,
    this.decorationColor,
    this.textColor,
    this.elevation,
    this.backgroundColor,
    this.isIconAfter = false,
    this.disabledBackgroundColor,
    this.foregroundColor,
    this.side,
    this.width,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor,
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
          elevation: elevation ?? 0,

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor:
              disabledBackgroundColor ?? AppColors.primary.withOpacity(.5),
          // surfaceTintColor: Colors.transparent,
          shadowColor: shadowColor,
          disabledForegroundColor: Colors.white,
          side: side,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: isIconAfter ? TextDirection.rtl : TextDirection.ltr,
          children: [
            icon ?? Container(),
            SizedBox(width: icon == null ? 0 : 12.w),
            SizedBox(
              child: AppText(
                title,
                decoration: textDecoration,
                fontWeight: fontWeight ?? FontWeight.w600,
                fontSize: fontSize ?? 15.sp,
                decorationColor: decorationColor,
                color: onPressed == null
                    ? Colors.white54
                    : (textColor ?? Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
