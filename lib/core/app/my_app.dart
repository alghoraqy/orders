import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:orders/core/app_router/app_router.dart';
import 'package:orders/core/screens/splash_screen.dart';

import 'app_root_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => AppRootProvider(
        child: GetMaterialApp(
          title: 'Orders',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppRouter.navigatorKey,
          home: const SplashScreen(),
          builder: (context, child) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}
