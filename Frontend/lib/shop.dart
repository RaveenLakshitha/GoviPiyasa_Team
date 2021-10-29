import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/Auth/shopservice.dart';
import 'package:http/http.dart' as http;
class Shop extends StatefulWidget {

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  Future<void> postData() async{
    try {
      final response =await http.post(
          Uri.parse("https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops"),
          body: {
            "shopName":shopName,
            "sellerName":sellerName,
            "contactNumber":phoneNo,
            "email":email,
            "city":city,
            "address":address,
          });
      print(response.body);
    }catch(e){
      print(e);
    }
  }
  var shopName,email,sellerName,phoneNo,address,city,token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text('create shop',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body: SingleChildScrollView(

          child: Container(
            margin: const EdgeInsets.only(top: 5.0),
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("images/login.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
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
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed:postData,
                          child: Text('create shop 2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
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
