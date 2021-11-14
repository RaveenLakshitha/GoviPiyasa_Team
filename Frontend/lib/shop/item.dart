import 'package:blogapp/shop/itemservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'additem.dart';

class Item extends StatefulWidget {


  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  var itemName,description,price,qty,category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(

        child: Container(
          margin: const EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter item name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (val){
                            itemName=val;
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Description',
                              prefixIcon: Icon(Icons.attribution_outlined)),
                          onChanged: (val){
                            description=val;
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Price',
                            prefixIcon: Icon(Icons.contact_phone),
                          ),
                          onChanged: (val){
                            price=val;
                          },
                        ),

                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Quantity',
                            prefixIcon: Icon(Icons.attach_email_rounded),
                          ),
                          onChanged: (val){
                            qty=val;
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Category',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          onChanged: (val){
                            category=val;
                          },
                        ),
                      ),

                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed:(){
                          Itemservice().addItem(itemName,description,price,qty,category).then((val){
                            Fluttertoast.showToast(
                              msg: "item added",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>Addproduct()));

                          });
                        },
                        child: Text('add Item',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));

  }
}
