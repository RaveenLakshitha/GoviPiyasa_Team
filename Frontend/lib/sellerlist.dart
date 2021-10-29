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

final url="https://jsonplaceholder.typicode.com/posts";
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
  late List Data;
  fetchData() async {
    http.Response response =
    await http.get('https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops');
    setState(() {
      Data = json.decode(response.body);
    });
  }

*/
   Map data;
   List userData;
  getUsers() async {
    http.Response response=await http.get('https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops');
    data=json.decode(response.body);
    setState(() {
      userData=data['data'];

    });

  }
  void initState(){
    super.initState();
  //  getUsers();
   fetchPosts();
  //  fetchData();

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
            child:Row(
              children:<Widget>[
            Text("SellerName:${post['title']}"),
              ]
                    ),
            );


          }),
    );
  }
}
