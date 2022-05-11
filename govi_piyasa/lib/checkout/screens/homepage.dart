

import 'package:flutter/material.dart';
import 'package:govi_piyasa/checkout/widgets/allproducts.dart';

import '../screens/cart_screen.dart';

class HomePage1 extends StatelessWidget {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('Products'),
        actions: <Widget>[

          IconButton(icon: Icon(Icons.shopping_cart, size: 30,), onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
        ],
      ),
      body:Allproduct()
    );
  }
}