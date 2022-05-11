





import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/shop/shoprofile.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:logger/logger.dart';

import 'itemservice.dart';

class AddItem extends StatefulWidget {

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  FlutterSecureStorage storage = FlutterSecureStorage();
  var log = Logger();
  File _image;



/*Future getImage() async{
    final image=ImagePicker.pickImage(source:ImageSource.camera);
    setState(() {
      _image=image as File;
    });
  }*/

  String valueChoose;
  List listitem = ["Delivery Available", "Delivery not Available"];
  var itemname,description,price,quantity,category,deliverystatus;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Add Item',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
        ),
        body: SingleChildScrollView(

          child: Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'ItemName',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onChanged: (val){
                              itemname=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Description',
                                prefixIcon: Icon(Icons.attribution_outlined)),
                            onChanged: (val){
                              description=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'price',
                              prefixIcon: Icon(Icons.contact_phone),
                            ),
                            onChanged: (val){
                              price=val;
                            },
                          ),

                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'quantity',
                              prefixIcon: Icon(Icons.attach_email_rounded),
                            ),
                            onChanged: (val){
                              quantity=val;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'category',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            onChanged: (val){
                              category=val;
                            },
                          ),
                        ),


                        Container(
                          /*child:ImagePickerFormField(
                            child: Container(
                              height: 40,
                              child: Center(child: Text("Select Photo")),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                      color: Theme.of(context).disabledColor, width: 1)),
                            ),
                            previewEnabled: true,
                            autovalidate: true,
                            context: context,
                            onSaved: (value) {

                            },
                            validator: (value) {
                              if (value == null)
                                return "Please select a photo!";
                              else return null;  },
                            initialValue: null, //File("some source")
                          )*/
                        ),

                        Container(
                          child:Center(
                            child:Padding(
                              padding:const EdgeInsets.all(16.0),
                              child: Container(
                                padding: EdgeInsets.only(left:16,right:16),
                                decoration:BoxDecoration(
                                    border:Border.all(color:Colors.grey,width:1),
                                    borderRadius:BorderRadius.circular(15)
                                ),
                                child: DropdownButton(
                                  hint: Text("Delivery Availability"),
                                  dropdownColor: Colors.grey,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 36,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                  value:  deliverystatus,
                                  onChanged: (value) {
                                    setState(() {
                                      deliverystatus=value;
                                    });
                                  },
                                  items: listitem.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),

                              ),
                            ),

                          ),
                          /*
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Deliverystatus(yes/no)',
                              prefixIcon: Icon(Icons.add_location),
                            ),
                            onChanged: (val){
                              deliverystatus=val;
                            },
                          ),*/
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed:(){

                            Itemservice().addItem(itemname,description,price,quantity,category,deliverystatus).then((val){
                              Fluttertoast.showToast(
                                msg: val.data['msg'],
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Showitem()));

                            });
                          },
                          child: Text('Add Item',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
