import 'package:flutter_getx_state_management/models/cart_item.dart';
import 'package:flutter_getx_state_management/models/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            orderId: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now()));
    update();
  }
}