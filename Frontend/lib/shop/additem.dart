import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'item.dart';

class Addproduct extends StatefulWidget {
  @override
  _AddproductState createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

  final url = "https://mongoapi3.herokuapp.com/items";
  var _itemsJson = [];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _itemsJson = jsonData;
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
      final TextEditingController _text1=new TextEditingController();
      final TextEditingController _text2=new TextEditingController();
      final TextEditingController _text3=new TextEditingController();
      final TextEditingController _text4=new TextEditingController();
      final TextEditingController _text5=new TextEditingController();
          var text1,text2,text3,text4,text5;

      return AlertDialog(
        content: Form(
          key: _fromkey,
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _text1,
                onChanged: (val){
                  text1=val;
                },
              // validator: (val){
              //   return val.isEmpty?null:"Invalidfield";
              // },
                decoration: InputDecoration(
                  hintText: "Enter item name"
                ),
          ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text2,
                onChanged: (val){
                  text2=val;
                },
                // validator: (val){
                //   return val.isEmpty?null:"Invalidfield";
                // },
                decoration: InputDecoration(
                    hintText: "Price"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text3,
                onChanged: (val){
                  text3=val;
                },
                // validator: (val){
                //   return val.isEmpty?null:"Invalidfield";
                // },
                decoration: InputDecoration(
                    hintText: "Description"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text4,
                onChanged: (val){
                  text4=val;
                },
                // validator: (val){
                //   return val.isEmpty?null:"Invalidfield";
                // },
                decoration: InputDecoration(
                    hintText: "qty"
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: _text5,
                onChanged: (val){
                  text5=val;
                },
                // validator: (val){
                //   return val.isEmpty?null:"Invalidfield";
                // },
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


           // addItem(_text1.text, _text2.text, _text3.text, _text4.text, _text5.text);

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
        title: Text("My Shop"),
        actions: [
          IconButton(
            icon: Icon(Icons.create, color: Color(0xFF545D68)),
            onPressed: () {
         // showInformationDialog(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) =>Item()));
            },
          ),
        ],
      ),
      body:Container(

       child:ListView.builder(
            itemCount: _itemsJson.length,
            itemBuilder: (BuildContext context, index) {
              final item = _itemsJson[index];
              return Card(
                color: Colors.green,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(children: <Widget>[
                    ListTile(
                      leading: Image.network("https://www.woolha.com/media/2020/03/eevee.png"),
                      title: Text("Item name:${item['itemname']}"),
                      subtitle: Text("Description:${item['description']}"),
                      onTap: () {

                      },
                    ),


                  ]),
                ),
              );
            }),
      )

    );
  }
}
