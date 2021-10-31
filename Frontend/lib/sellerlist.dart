import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';

class SellerList extends StatefulWidget {

  @override
  _SellerListState createState() => _SellerListState();
}

class _SellerListState extends State<SellerList> {


  //https://jsonplaceholder.typicode.com/posts
final url="https://mongoapi3.herokuapp.com/users";
  var _postsJson=[];
  void fetchPosts() async{
    try{
      final response=await get(Uri.parse(url));
      final jsonData=jsonDecode(response.body) as List;
      setState(() {
        _postsJson=jsonData;
      });
    }catch(err){

    }
  }
/*
  final httpClient=http.Client();
  List<dynamic> todoData;
  Future fetchData() async {
    final Uri restAPIURL=
    Uri.parse("http://localhost:3000/users");
    http.Response response=await httpClient.get(restAPIURL);
 final Map parsedData=await json.decode(response.body.toString());
 todoData=parsedData['result'];

  }
*/
/*
   Map data;
   List userData;
  fgetUsers() async {
    http.Response response=await http.get('https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops');
    data=json.decode(response.body);
    setState(() {
      userData=data['data'];

    });

  }*/
  void initState(){
    super.initState();
  //  getUsers();
   fetchPosts();
  // fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text('UserList',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body:ListView.builder(
          itemCount:_postsJson.length,
          itemBuilder:(BuildContext context,index){
final post=_postsJson[index];
            return Card(
              child:Padding(
                padding: EdgeInsets.all(10.0),
            child:Row(
              children:<Widget>[
            Text("ShopName:${post['shopname']}"),
                Text("SellerName:${post['sellername']}"),
              ]
                    ),
              ),);


          }),
    );
  }
}
