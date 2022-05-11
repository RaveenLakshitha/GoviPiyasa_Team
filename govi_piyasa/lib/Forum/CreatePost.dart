

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/shop/itemservice.dart';

import 'package:http/http.dart' as http;

import 'Postlist.dart';


class CreatePost extends StatefulWidget {
  String value;
CreatePost({this.value});
  @override
  _AddItemState createState() => _AddItemState(value);
}

class _AddItemState extends State<CreatePost> {
  String valueChoose;
  List listitem = ["Delivery Available", "Delivery not Available"];
  var title,description,category;

  var Token;

  _AddItemState(this.value);
  String value;
  FlutterSecureStorage storage = FlutterSecureStorage();


  Future<void> gettoken() async {
    String token = await storage.read(key: "token");
    Token=token;
  }
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
  gettoken();
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text(value,
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body:Card(
            margin: EdgeInsets.all(20),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child:SingleChildScrollView(

              child: Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: EdgeInsets.all(6.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  prefixIcon: Icon(Icons.person),
                                ),
                                onChanged: (val){
                                  title=val;
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
                              child:Center(
                                child:Padding(
                                  padding:const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left:16,right:16),
                                    decoration:BoxDecoration(
                                        border:Border.all(color:Colors.grey,width:1),
                                        borderRadius:BorderRadius.circular(15)
                                    ),
                                    child: DropdownButton(
                                      hint: Text("Category"),
                                      dropdownColor: Colors.grey,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                      ),
                                      value:  category,
                                      onChanged: (value) {
                                        setState(() {
                                          category=value;
                                        });
                                      },
                                      items: listitem.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),

                                  ),
                                ),

                              ),

                            ),

                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              onPressed:(){

                                Itemservice().addQuestion(title, category, description,Token).then((val){
                                  Fluttertoast.showToast(
                                    msg: val.data['msg'],
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Postlist()));

                                });
                              },
                              child: Text('Add Item',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.green,
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
            )
        ),

      );
  }
}
