import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orders/core/app_router/app_router.dart';
import 'package:orders/core/utils/app_button.dart';
import 'package:orders/core/utils/app_text.dart';
import 'package:orders/core/utils/extensions.dart';
import 'package:orders/module/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders/module/orders/presentation/cubit/orders_state.dart';
import 'package:orders/module/orders/presentation/screens/first_screen.dart';
import 'package:orders/module/orders/presentation/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText('Home Screen',
            fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      body: BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppButton(
                  title: 'First Screen',
                  onPressed: () => AppRouter.to(const FirstScreen()),
                  radius: 10.r),
              20.height,
              AppButton(
                  title: 'Second Screen',
                  onPressed: () => AppRouter.to(const SecondScreen()),
                  radius: 10.r),
            ],
          ),
        );
      }),
    );
  }
}
