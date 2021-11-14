import 'package:blogapp/Screen/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'architecture.dart';


class Service extends StatefulWidget {


  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10.0,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Shop()));
            },
             child: Container(
               decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.lightGreenAccent,
                     width: 4,
                   ),
                 color: const Color(0xff7c94b6),
               ),

                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/welcome.jpg',
                  fit: BoxFit.cover,
                ),
              ),
          ),

          Card(
            color:Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title:Text("Create Shop ") ,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Shop()));
              },
            ),
          ),
          Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text("Create Architecture Profile"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Architect()));
              },
            ),
          ),
          Card(
            child:Container(
              child: ListTile(
                title: Text("Create Architecture Profile"),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Architect()));
                },
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),

          ),

        ],
        padding: EdgeInsets.all(10),
        itemExtent: 100,
      ),
    );

  }
}
