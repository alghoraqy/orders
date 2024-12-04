import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orders/core/app_injections/app_injection.dart';
import 'package:orders/core/bloc_observer/bloc_observer.dart';

class AppInitializer {
  static initSettings() async {
    await AppInjection.init();
    await _setupAppOverlayAndLandscape();
     _setBlocObserver();
  }

  static _setupAppOverlayAndLandscape() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

   static void _setBlocObserver() => Bloc.observer = MyBlocObserver();
}
