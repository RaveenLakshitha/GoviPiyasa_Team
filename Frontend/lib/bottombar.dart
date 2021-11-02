import 'package:flutter/material.dart';
import 'package:govi_piyasa/shop.dart';

import 'Delivery.dart';
import 'Forum/create_post.dart';
import 'Forum/list_post.dart';
import 'Forum/post_details.dart';
import 'home.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.lightGreen,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                ),
                color: Colors.lightGreen
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width /2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyHomePage())); },
                            child: Icon(Icons.home, color: Color(0xFFEF7532)),
                          ),

                          GestureDetector(
                            onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>PostDetail(18))); },
                            child: Icon(Icons.person_outline, color: Color(0xFF676E79)),
                          ),
                        ],

                      )

                  ),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width /2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CreatePost())); },
                           child: Icon(Icons.search, color: Color(0xFF676E79)),
                          ),
                          GestureDetector(
                            onTap: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPost())); },
                            child: Icon(Icons.shopping_basket, color: Color(0xFF676E79)),
                          ),
                        ],
                      )
                  ),
                ]
            )
        )
    );
  }
}