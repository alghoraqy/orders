import 'package:get_it/get_it.dart';
import 'package:orders/module/orders/presentation/cubit/orders_cubit.dart';

var getIt = GetIt.instance;

class AppInjection {
  static Future<void> init() async {
    getIt.registerFactory(() => OrdersCubit());
  }
}
