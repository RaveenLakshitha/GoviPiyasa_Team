import 'dart:convert';

import 'package:blogapp/CustumWidget/shopservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
class Architect extends StatefulWidget {

  @override
  _ArchitectState createState() => _ArchitectState();
}

class _ArchitectState extends State<Architect> {
/*  "sellerName":sellerName,
  "contactNumber":phoneNo,
  "email":email,
  "address":address,*/
/*
 Future<void> postData() async{
    try {
      final response =await http.post(
          Uri.parse("http://localhost:5000/userTask/createUserTask"),
          body: {
            "name":shopName,
            "age":city

          });
      print(response.body);
    }catch(e){
      print(e);
    }
  }*/
  /*
  final httpClient=http.Client();
  Map<String,dynamic> customHeaders={
    "Accept":"application/json",
    "content-Type":"application/json;charset=UTF-8"
  };

  Future addData(Map body) async{
    final Uri restAPIURL=
    Uri.parse("https://jsonplaceholder.typicode.com/albums");
    http.Response response=await httpClient.post(restAPIURL
        ,headers: customHeaders,body: jsonEncode(body));
    return response.body;

  }*/
  var AName,about,designation,token,team,phoneNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Create Architecture Profile',
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
                  child: Image(
                    image: AssetImage("assets/architect.jpg"),
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
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (val){
                             AName=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Designation',
                                prefixIcon: Icon(Icons.attribution_outlined)),
                            onChanged: (val){
                              designation=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'ContactNumber',
                              prefixIcon: Icon(Icons.contact_phone),
                            ),
                            onChanged: (val){
                              phoneNo=val;
                            },
                          ),

                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'About',
                              prefixIcon: Icon(Icons.attach_email_rounded),
                            ),
                            onChanged: (val){
                              about=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Team',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (val){
                              team=val;
                            },
                          ),
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed:(){
                            ShopService().addArchitect(AName,designation,phoneNo,about,team).then((val){
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
