import 'package:orders/module/orders/data/model/order.dart';

abstract class OrdersState {}

class OrdersInitialState extends OrdersState {}

class LoadingOrdersState extends OrdersState {}

class SuccessGetOrdersState extends OrdersState {
  final List<Order> orders;

  SuccessGetOrdersState({required this.orders});
}

class FailedGetOrdersState extends OrdersState {}
