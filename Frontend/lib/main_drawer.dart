

import 'package:flutter/material.dart';
import 'package:govi_piyasa/screeen/Cart.dart';
import 'package:govi_piyasa/sellerlist.dart';
import 'package:govi_piyasa/shop.dart';

import 'feedback.dart';




class MainDrawer extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/logo.jpg'),
                fit: BoxFit.cover,
              ),


            ),
            color: Theme.of(context).accentColor,
            child: Center(
              child:Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top:30,
                      bottom:10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(

                            image: AssetImage('images/newappicon.png'),
                            fit:BoxFit.fill
                        )

                    ),


                  ),
                  Text('Ashen Nilura' ,style:TextStyle(fontSize: 22,color:Colors.white),
                  ),
                  Text('ashennilura@gmail.com' ,style:TextStyle(color:Colors.white),)
                ],
              ),

            ),
          ),
          ListTile(
            leading: Icon(Icons.airport_shuttle),
            title:Text('Delivery', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title:Text('Cart', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>CartApp()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings_rounded ),
            title:Text('Userlist', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SellerList()));
            } ,
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title:Text('Create Shop', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Shop()));
            },
          ),
          ListTile(
            leading: Icon(Icons.chat_bubble_outlined),
            title:Text('Feedback', style:TextStyle(fontSize: 12,),
            ),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ReachUs()));
            },
          ),


        ],
      ),
    );
  }
}