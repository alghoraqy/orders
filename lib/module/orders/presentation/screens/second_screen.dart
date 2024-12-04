import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orders/module/orders/data/model/order.dart';
import 'package:orders/module/orders/presentation/cubit/orders_cubit.dart';
import 'package:orders/module/orders/presentation/cubit/orders_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:collection/collection.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<OrderCountData> _prepareChartData(List<Order> orders) {
    final groupedOrders = groupBy(
      orders,
      (Order order) => DateTime(
          order.registered.year, order.registered.month, order.registered.day),
    );

    return groupedOrders.entries.map((entry) {
      return OrderCountData(
        date: entry.key,
        orderCount: entry.value.length,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Graph')),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          OrdersCubit ordersCubit = OrdersCubit.of(context);
          List<OrderCountData> chartData =
              _prepareChartData(ordersCubit.orders);
          return SfCartesianChart(
              primaryXAxis: DateTimeCategoryAxis(
                title: AxisTitle(text: 'Time'),
              ),
              primaryYAxis: NumericAxis(
                minimum: 1,
                title: AxisTitle(text: 'order count'),
              ),
              title: ChartTitle(text: 'Orders Graph'),
              legend: Legend(isVisible: true),
              series: <LineSeries<OrderCountData, DateTime>>[
                LineSeries<OrderCountData, DateTime>(
                  dataSource: chartData,
                  xValueMapper: (OrderCountData order, _) => order.date,
                  yValueMapper: (OrderCountData order, _) => order.orderCount,
                  enableTooltip: true,
                )
              ]);
        },
      ),
    );
  }
}

class OrderCountData {
  final DateTime date;
  final int orderCount;

  OrderCountData({required this.date, required this.orderCount});
}
