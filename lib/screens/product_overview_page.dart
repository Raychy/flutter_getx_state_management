import 'package:flutter/material.dart';
import 'package:flutter_getx_state_management/controllers/cart_controller.dart';
import 'package:flutter_getx_state_management/widgets/app_drawer.dart';
import 'package:flutter_getx_state_management/widgets/product_grid.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import 'cart_screen.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (contex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0),
                  child: Badge(
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                        ),
                        onPressed: () {
                          Get.to(() => CartScreen());
                        }),
                    badgeContent: Text(cartController.itemCount.toString()),
                    badgeColor : Theme.of(context).accentColor,
                  ),
                );
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}