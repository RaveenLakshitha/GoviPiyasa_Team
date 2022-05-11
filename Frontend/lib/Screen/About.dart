import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:url_launcher/url_launcher.dart';


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  File _image;
  String _imagepath;

  var token;
  String finalemail;

  /*
  Future getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainemail = pref.getString('email');
    setState(() {
      finalemail = obtainemail;
    });
  }
*/
  void initState() {
    //  getNotes();
    loadimage();
  }



  @override
  Widget build(BuildContext context) {

    String members="SC/2018/10666 W.D.N.P. WARNAKULA.\nSC/2018/10671 A.N.R. VISVAKULA.\nSC/2018/10686 K.R.L.WICKRAMASINGHE.\nSC/2018/10694 W.K.R.S. WALPITA";
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[800], Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 110.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: _image != null
                          ? FileImage(_image)
                          : AssetImage('assets/original_logo.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Govi Piyasa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      finalemail,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 290.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About Us",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Colors.blueAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Group Members",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              members,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Text("Great Life for great people"),
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }

  void pickimage() async {
  //  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
 //   setState(() {
    //  _image = image;
  //  });
  }

  void Saveimage(path) async {
   // SharedPreferences saveimage = await SharedPreferences.getInstance();
    //saveimage.setString("imagepath", path);
  }

  void loadimage() async {
   // SharedPreferences saveimage = await SharedPreferences.getInstance();
    // SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
     // _imagepath = saveimage.getString("imagepath");
    //  finalemail=saveimage.getString("email");
    });
  }
}
