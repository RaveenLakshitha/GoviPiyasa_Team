import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/Auth/shopservice.dart';
class Shop extends StatefulWidget {


  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var shopName,email,sellerName,phoneNo,address,city,token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Form(
                    key: null,//null
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'ShopName',
                                prefixIcon: Icon(Icons.person),
                              ),
                            onChanged: (val){
                              shopName=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                // if (input.isEmpty) return 'Enter Email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'SellerName',
                                  prefixIcon: Icon(Icons.email)),
                            onChanged: (val){
                              sellerName=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'ContactNumber',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            onChanged: (val){
                              phoneNo=val;
                            },
                          ),

                        ),

                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(

                            decoration: InputDecoration(
                              labelText: 'email',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (val){
                              email=val;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'city',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (val){
                              city=val;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'address',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (val){
                              address=val;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed:(){
                            ShopService().addShop(shopName,sellerName,phoneNo,email,city,address).then((val){
                              Fluttertoast.showToast(
                                msg: val.data['msg'],
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );

                            });
                          },
                          child: Text('create shop',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
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
