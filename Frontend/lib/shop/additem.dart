import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:govi_piyasa/shop/itemservice.dart';
import 'package:http/http.dart';

class Addproduct extends StatefulWidget {


  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

  final url = "https://mongoapi3.herokuapp.com/items";
  var _postsJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }
  void initState() {
    super.initState();
    fetchPosts();

  }


  GlobalKey<FormState> _fromkey=GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context)async{



    return await showDialog(context: context,
        builder: (context){
      final TextEditingController _text1=TextEditingController();
      final TextEditingController _text2=TextEditingController();
      final TextEditingController _text3=TextEditingController();
      final TextEditingController _text4=TextEditingController();
      final TextEditingController _text5=TextEditingController();

      return AlertDialog(
        content: Form(
          key: _fromkey,
          child:Column(
            children: [
              TextFormField(
                controller: _text5,
              validator: (value){
                return value.isEmpty?null:"Invalidfield";
              },
                decoration: InputDecoration(
                  hintText: "Enter item name"
                ),
          ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text1,
                validator: (value){
                  return value.isEmpty?null:"Invalidfield";
                },
                decoration: InputDecoration(
                    hintText: "Price"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text2,
                validator: (value){
                  return value.isEmpty?null:"Invalidfield";
                },
                decoration: InputDecoration(
                    hintText: "Description"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text3,
                validator: (value){
                  return value.isEmpty?null:"Invalidfield";
                },
                decoration: InputDecoration(
                    hintText: "qty"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text4,
                validator: (value){
                  return value.isEmpty?null:"Invalidfield";
                },
                decoration: InputDecoration(
                    hintText: "category"
                ),
              ),
            ],
          ),
        ),
        actions:<Widget>[
          TextButton(
          child:Text("Add Product"),
          onPressed:(){
            if(_fromkey.currentState.validate()){
              Itemservice().addItem(_text1.text,_text2.text,int.parse(_text3.text),int.parse(_text4.text),_text5.text).then((val){
                Fluttertoast.showToast(
                  msg: "successfuly added",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );

                Navigator.of(context).pop();
              });
            }

          }),
          TextButton(
              child:Text("Cancel"),
              onPressed:(){

                  Navigator.of(context).pop();


              }),
        ],
      );
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Idd_Item"),
        actions: [
          IconButton(
            icon: Icon(Icons.create, color: Color(0xFF545D68)),
            onPressed: () {
          showInformationDialog(context);

            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/shop.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                child:ListView.builder(
                    itemCount: _postsJson.length,
                    itemBuilder: (BuildContext context, index) {
                      final post = _postsJson[index];
                      return Card(
                        color: Colors.green,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://www.woolha.com/media/2020/03/eevee.png'),
                            ),
                            ListTile(
                             // leading: Image.network("${post['']}"),
                              title: Text("Item name:${post['itemname']}"),
                              subtitle: Text("Description:${post['description']}"),
                              onTap: () {

                              },
                            ),
                            ListTile(
                              title: Text("Price:${post['price']}"),
                              subtitle: Text("Quantity:${post['quantity']}"),
                              trailing: Text("Category:${post['category']}"),
                              onTap: () {

                              },
                            ),
                          ]),
                        ),
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
