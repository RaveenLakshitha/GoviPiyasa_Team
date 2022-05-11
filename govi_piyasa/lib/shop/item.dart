
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  String valueChoose;
  List listitem = ["Delivery Available", "Delivery not Ava"];
  IconData iconphoto = Icons.image;
  var itemName, description, price, qty, category, image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter item name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (val) {
                          itemName = val;
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Description',
                            prefixIcon: Icon(Icons.attribution_outlined)),
                        onChanged: (val) {
                          description = val;
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price',
                          prefixIcon: Icon(Icons.contact_phone),
                        ),
                        onChanged: (val) {
                          price = val;
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                          prefixIcon: Icon(Icons.attach_email_rounded),
                        ),
                        onChanged: (val) {
                          qty = val;
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        onChanged: (val) {
                          category = val;
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: _imageFile.path,
                          prefixIcon: IconButton(
                          onPressed:takeCoverPhoto,
                          icon: Icon(Icons.image),
                        ),
                        ),

                      ),
                    ),/*
                   Center(
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
                           value: valueChoose,
                           onChanged: (value) {
                             setState(() {
                               valueChoose:value;
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
*/
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: () {
                        /*
                        Itemservice()
                            .addItem(itemName, description, price, qty,
                                category,image)
                            .then((val) {
                          Fluttertoast.showToast(
                            msg: "Item added",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Showitem()));
                        });*/
                      },
                      child: Text('add Item',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      color: Colors.orange,
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

  void takeCoverPhoto() async {
    final coverPhoto = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = coverPhoto;
     // iconphoto = Icons.check_box;
    });
  }
}
