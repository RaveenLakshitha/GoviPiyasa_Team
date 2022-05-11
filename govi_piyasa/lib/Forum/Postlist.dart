import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart';

import 'CreatePost.dart';
class Postlist extends StatefulWidget {


  @override
  _State createState() => _State();
}

class _State extends State<Postlist> {

  final url="https://mongoapi3.herokuapp.com/posts";

  var _postsJson = [];
  String answer;
  void getPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 3));
  }
  void initState() {
    super.initState();
    getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          flexibleSpace: Image(
            image: AssetImage('assets/about.jpg'),
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.plus),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreatePost(),
                      ));
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refreshList,
          child: ListView.builder(
              itemCount: _postsJson.length,
              itemBuilder: (BuildContext context, index) {
                final post = _postsJson[index];
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                tileColor: Colors.lightGreenAccent,
                    title: Text("Question:${post['title']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Category:${post['category']}"),
                        Text("description:${post['description']}"),

                      ],
                    ),
                    trailing:Row(

                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Comment here',
                              prefixIcon: Icon(Icons.attribution_outlined)),
                          onChanged: (val){
                            answer=val;
                          },
                        ),
                        IconButton(icon: Icon(Icons.add_task_rounded ,),
                          onPressed: (){
                            Fluttertoast.showToast(
                              msg: "Added",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },),
                      ]


                  ),),
                );
              }),
        )
    );
  }
}
