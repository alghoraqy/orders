import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/core/app_injections/app_injection.dart';
import 'package:orders/module/orders/presentation/cubit/orders_cubit.dart';

class AppRootProvider extends StatelessWidget {
  final Widget child;

  const AppRootProvider({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Orders
        BlocProvider(create: (context) => getIt<OrdersCubit>()..loadOrders()),
      ],
      child: child,
    );
  }
}
