
import 'package:flutter/material.dart';
import 'package:govi_piyasa/Pdf/pdf.dart';
import 'package:govi_piyasa/checkout/models/orders.dart';
import 'package:govi_piyasa/payment/gateway/payment.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name)),
          ),
          CheckoutButton(
            cart: cart,
          ),
           FlatButton(
               onPressed: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) =>    Payment(),
                     ));

              },
             child: Text(
                'Checkout',
                 style: TextStyle(color: Colors.blue, fontSize: 20),
             ))
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Checkout'),
      onPressed: widget.cart.totalAmount <= 0
          ?   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>    Pdf(amount:"${widget.cart.totalAmount}"),
          ))
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },
    );
  }
}
