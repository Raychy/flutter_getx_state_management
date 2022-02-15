import 'package:flutter/material.dart';
import 'package:flutter_getx_state_management/models/order.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItems extends StatefulWidget {
  final Order order;

  OrderItems(this.order);

  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    int productLength = widget.order.products.length * 20 + 10 ;
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(productLength.floorToDouble(), 180),
              child: ListView(
                children: widget.order.products
                    .map(
                      (product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product.productTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${product.productQuantity}X ₦${product.productPrice}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}