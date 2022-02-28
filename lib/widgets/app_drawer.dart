import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/helpers/custom_route.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';
import 'package:shop_app/providers/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shop), title: Text("Shop"),onTap: (){
            Navigator.of(context).pushReplacementNamed("/");
          },),
          Divider(),
          ListTile(leading: Icon(Icons.credit_card), title: Text("Orders"),onTap: (){
            Navigator.of(context).pushReplacement(CustomRoute(builder: (ctx) => OrdersScreen()));
          },),
          Divider(),
          ListTile(leading: Icon(Icons.edit), title: Text("Manage Products"),onTap: (){
            Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
          },),
          Divider(),
          ListTile(leading: Icon(Icons.exit_to_app), title: Text("Logout"),onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed("/");
            // Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
          Provider.of<Auth>(context, listen: false).logOut();
          },),
        ],
      ),
    );
  }
}