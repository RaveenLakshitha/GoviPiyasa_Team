import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerList extends StatefulWidget {
  @override
  _SellerListState createState() => _SellerListState();
}

class _SellerListState extends State<SellerList> {
  void lanchwhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("can't open whatsapp");
  }

  //https://jsonplaceholder.typicode.com/posts
  // https://mongoapi3.herokuapp.com/users
/*



*/
  final url = "https://mongoapi3.herokuapp.com/experts";
  var _postsJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  void initState() {
    super.initState();
    //  getUsers();
    fetchPosts();
    // fetchData();
  }

  Future<Null> refreshList2() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text('ExpertList',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body: RefreshIndicator(
          onRefresh: refreshList2,
          child: ListView.builder(
              itemCount: _postsJson.length,
              itemBuilder: (BuildContext context, index) {
                final post = _postsJson[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Image.network("${post['location']}"),
                    title: Text("Name:${post['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Contact:+94${post['contact']}"),
                        Text("Designation:${post['designation']}"),
                      ],
                    ),
                    trailing: GestureDetector(
                      child: Icon(Icons.add_call),
                      onTap: () {
                        lanchwhatsapp(
                            number: "+94${post['contact']}", message: "hello");
                      },
                    ),
                    isThreeLine: true,
                  ),
                );
              }),
        ));
  }
}
