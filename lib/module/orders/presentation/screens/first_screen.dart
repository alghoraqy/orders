import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders/core/constants/app_colors.dart';
import 'package:orders/core/utils/app_text.dart';
import 'package:orders/core/utils/extensions.dart';
import 'package:orders/module/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders/module/orders/presentation/cubit/orders_state.dart';
import 'package:orders/module/orders/presentation/widgets/numeric_metrices_card.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          'First Screen',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
        OrdersCubit ordersCubit = OrdersCubit.of(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             NumericMetricesCard(title: 'Total Count', amount: ordersCubit.totalCount.toString()),
             10.height,
              NumericMetricesCard(title: 'Average Price', amount: ordersCubit.averagePrice.toString()),
             10.height,
              NumericMetricesCard(title: 'Number of returns', amount: ordersCubit.returnsCount.toString()),
             10.height,
            ],
          ),
        );
      }),
    );
  }
}
