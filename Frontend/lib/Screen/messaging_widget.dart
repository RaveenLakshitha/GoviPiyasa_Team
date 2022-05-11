import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Messaging_Widget extends StatefulWidget {


  @override
  _Messaging_WidgetState createState() => _Messaging_WidgetState();
}

class _Messaging_WidgetState extends State<Messaging_Widget> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";
  String messageDescription="Empty";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (message) async{

        setState(() {
          messageTitle = message["notification"]["title"];
          messageDescription = message["notification"]["description"];
          notificationAlert = "New Notification Alert";
        });

      },
      onResume: (message) async{

        setState(() {
          messageTitle = message["data"]["title"];
          messageDescription = message["notification"]["description"];
          notificationAlert = "Application opened from Notification";
        });

      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        flexibleSpace: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
              colors:[Colors.blue,Colors.cyanAccent],
              begin: Alignment.bottomRight,
              end:Alignment.topLeft,


            ),
          ),
        ),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              notificationAlert,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.grey[300],),
            ),
            Text(
              messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              messageDescription,
            ),
          ],
        ),
      ),
    );
  }
}
