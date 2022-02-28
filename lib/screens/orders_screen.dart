import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';
import 'package:shop_app/providers/products_provider.dart';

class OrdersScreen extends StatefulWidget {
static const routeName = "/orders";

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).setAndFetchOrders();
  }
  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(future: _ordersFuture, builder: (ctx, dataSnapShot) {
        if (dataSnapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapShot.error != null) {
            return Center(child: Text("ERROR"));
          }else {
            return Consumer<Orders>(builder: (ctx, orderData, child) => ListView.builder(
              itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
              itemCount: orderData.orders.length,
            ),);
          }
        }
      },)
    );
  }
}
