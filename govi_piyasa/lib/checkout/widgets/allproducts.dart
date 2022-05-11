import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govi_piyasa/checkout/models/cart.dart';
import 'package:govi_piyasa/checkout/models/products.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'itemdetails.dart';

class Allproduct extends StatefulWidget {
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  final url = "https://mongoapi3.herokuapp.com/items";
  var _itemsJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _itemsJson = jsonData;
      });
    } catch (err) {}
  }

  void initState() {
    super.initState();
    fetchPosts();
  }

//final List<itemmodel> itemdata=List.generate(_itemsJson.length, (index) => null)
  @override
  Widget build(BuildContext context) {
    // var myobj;
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _itemsJson.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final item = _itemsJson[index];

          return Card(
            color: Colors.amber,
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("${item['image']}"),
                ListTile(
                  isThreeLine: true,
                  title: Text("Item:${item['itemname']}"),
                  subtitle: Text("Price:Rs${item['price']}"),
                  trailing: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('Item Added to Cart'),
                        ));
                        //String num="$item['price']";
                      double  myDouble = double.parse("${item['price']}");
                        cart.addItem("${item['itemname']}", "${item['itemname']}",myDouble);
                      }),
                  onTap: () {
                     Navigator.push(
                         context,
                        MaterialPageRoute(
                          builder: (context) => Itemdetails(text: '${item['itemname']}',price:'${item['price']}',image:'${item['image']}',description:'${item['description']}',quantity:'${item['quantity']}',category:'${item['category']}'),
                         ));
                  },
                ),
              ],
            ),
          );
        });
  }
}
