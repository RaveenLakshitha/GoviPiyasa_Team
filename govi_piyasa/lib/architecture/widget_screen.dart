
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:govi_piyasa/websites/website1.dart';

import 'cardModel.dart';
import 'carouselSlider.dart';

class WidgetScreen extends StatefulWidget {
  @override
  _WidgetScreenState createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(

          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, bottom: 25),
                    child: Text(
                      "Let's Create Your Shop",
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 23, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Services",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Carouselslider(),
                  ),
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    child: Container(
                      height: 150.0,
                      margin: EdgeInsets.all(20.0),
                      child: Card(


                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 5.0,
                            ),
                            Image.asset(
                              'assets/flowers.png',
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.contain,
                            ),
                            const ListTile(
                              title: Text('Go to website',
                                  style: TextStyle(color: Colors.green, fontSize: 20)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>Website1()));
                    },
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
