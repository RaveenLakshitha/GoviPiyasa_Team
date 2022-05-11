
import 'package:flutter/material.dart';
import 'package:govi_piyasa/checkout/screens/pdt_detail_screen.dart';

import './screens/homepage.dart';
import 'package:provider/provider.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';
import 'models/orders.dart';
import 'models/products.dart';


class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-commerce App',
        theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.white),
        home: HomePage1(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
