import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders/core/constants/app_colors.dart';
import 'package:orders/core/utils/app_text.dart';

class NumericMetricesCard extends StatelessWidget {
  const NumericMetricesCard({super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10.r)),
      child: Center(
          child: AppText(
        '$title: $amount',
        color: Colors.white,
      )),
    );
  }
}
