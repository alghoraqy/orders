import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/core/constants/app_jsons.dart';
import 'package:orders/module/orders/data/model/order.dart';
import 'package:orders/module/orders/presentation/cubit/orders_state.dart';
import 'package:collection/collection.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());

  static OrdersCubit of(context) => BlocProvider.of(context);

  int? totalCount;
  double? averagePrice;
  int? returnsCount;

  List<Order> orders = [];

  Future<void> loadOrders() async {
    emit(LoadingOrdersState());
    final jsonString = await rootBundle.loadString(AppJsons.orders);
    final List<dynamic> jsonData = json.decode(jsonString);
    orders = jsonData.map((json) => Order.fromJson(json)).toList();
    await calculateNumericMetrices();
    groupOrders();
    emit(SuccessGetOrdersState(orders: orders));
  }

  calculateNumericMetrices() async {
    totalCount = orders.length;
    averagePrice = (orders.map((order) => order.price).reduce((a, b) => a + b) / totalCount!)
        .toDouble()
        .toPrecision(3);
    returnsCount = orders
        .where((order) => order.status == OrderStatus.returned.text)
        .length;
  }

  Map<DateTime, List<Order>> groupedOrders = {};
  groupOrders() async {
    groupedOrders = groupBy(
        orders,
        (Order order) => DateTime(order.registered.year, order.registered.month,
            order.registered.day));
  }
}
