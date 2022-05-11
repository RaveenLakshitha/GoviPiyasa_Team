import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Informations",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.only(top: 14),
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        //print("images path: ${cards[index].cardImage.toString()}");
                        return Container(
                          margin: EdgeInsets.only(right: 14),
                          height: 150,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(cards[index].cardBackground),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(3, 3),
                                ),
                              ],
                               image: DecorationImage(
                                 image: AssetImage(cards[index].cardIcon),
                                 fit: BoxFit.fill,
                               ),
                              ),
                          // ignore: deprecated_member_use

                        );
                      },
                    ),
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
