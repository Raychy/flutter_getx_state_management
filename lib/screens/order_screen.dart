import 'package:flutter/material.dart';
import 'package:flutter_getx_state_management/controllers/order_controller.dart';
import 'package:flutter_getx_state_management/widgets/app_drawer.dart';
import 'package:flutter_getx_state_management/widgets/order_items.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItems(orderController.orders[index])),
    );
  }
}