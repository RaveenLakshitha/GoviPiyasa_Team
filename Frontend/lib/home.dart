import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:govi_piyasa/login_screen.dart';
import 'package:govi_piyasa/screeen/Cart.dart';

import 'package:govi_piyasa/shop.dart';
import 'bottombar.dart';
import 'item_page.dart';
import 'main_drawer.dart';
import 'dart:async';

import 'messaging_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
   TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  Future getimgfromFirebase() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
    await firestore.collection("Carousel_images").getDocuments();
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Dashboard',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Messaging_Widget()));
            },
          ),

          PopupMenuButton<int>(
              onSelected: (item)=>onSelected(context,item),
              itemBuilder: (context)=>[

                PopupMenuItem<int>(
                  value:0,
                  child:Row(
                    children:[
                      Icon(Icons.account_balance_rounded,color:Colors.blue),
                      Text("Shop create"),
                    ],

                  ),


                ),
                PopupMenuItem<int>(
                  value:1,
                  child:Row(
                    children:[
                      Icon(Icons.logout,color:Colors.blue),
                      Text("Signout"),
                    ],

                  ),

                ),
              ],)
        ],
      ),
      drawer: MainDrawer(),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            height: 200,
            child: FutureBuilder(
              future: getimgfromFirebase(),
              builder: (_, snapshot) {
                return CarouselSlider.builder(

                  slideBuilder: (index){
                    DocumentSnapshot sliderimage=snapshot.data[index];

                    return Container(
                        child: GestureDetector(

                            child: Image.network(sliderimage['img']),
                            onTap: () {
                              Navigator.push<Widget>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(),
                                ),
                              );
                            }));},

                  autoSliderTransitionTime: Duration(
                    milliseconds: 100,

                  ),

                  slideTransform: CubeTransform(
                    rotationAngle: 0,
                  ),
                  slideIndicator: CircularSlideIndicator(
                    indicatorBorderColor: Colors.red,
                    currentIndicatorColor: Colors.blue,

                  ),
                  itemCount: snapshot.data.length,
                );

              },
            ),
          ),
          SizedBox(height: 15.0),
          Text('Categories',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Plants',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Architectures',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Seeds',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductPage(),
                    ProductPage(),
                    ProductPage(),

                  ]
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

 void onSelected(BuildContext context, int item) {
    switch(item){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Shop()));break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Login()));break;
    }
  }
}

