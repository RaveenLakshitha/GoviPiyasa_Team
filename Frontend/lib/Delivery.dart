import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  void lanchwhatsapp({@required number, @required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunch(url) ? launch(url) : print("can't open whatsapp");
  }
  //https://jsonplaceholder.typicode.com/posts
  // https://mongoapi3.herokuapp.com/users

  final url = "https://mongoapi3.herokuapp.com/delivery";
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
  void initState() {
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
        title: Text('DeliveryPeople',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),
      body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (BuildContext context, index) {
            final post = _postsJson[index];
            return Card(
              color: Colors.green,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                  ),
                  ListTile(
                    leading: Image.network("${post['location']}"),
                    title: Text("Name:${post['name']}"),
                    subtitle: Text("Contact:+94${post['contact']}"),
                    trailing: Text("Type:${post['type']}"),
                    onTap: () {
                      lanchwhatsapp(
                          number: "+94${post['contact']}", message: "hello");
                    },
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
