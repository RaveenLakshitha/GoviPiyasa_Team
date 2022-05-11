import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'additem.dart';
import 'item.dart';

import 'itemservice.dart';

class Showitem extends StatefulWidget {

//  final Album cases;
  _ShowitemState createState() => _ShowitemState();
}

class _ShowitemState extends State<Showitem> {
  final Itemservice api = Itemservice();
  File _image;
  String _imagepath;
  String text;
 // Future<Album> _futureAlbum;
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
/*
  void SaveImage(path) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("imagepath", path);
  }

  Future<bool> deletePost(int id) async {
    final response =
    await http.delete("https://mongoapi3.herokuapp.com/item/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void takeCoverPhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
*/
  void initState() {
    super.initState();
    fetchPosts();
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    String city = "Ja-ela";
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddItem(),
                    ));
              }),
        ],
      ),
      //AssetImage("assets/architect.jpg")
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Row(children: [
                    SizedBox(
                      height: 150,
                      child: Center(
                        child: Row(
                            children: [

                              Image(
                                image:AssetImage("assets/architect.jpg"),


                                fit: BoxFit.contain,
                                height: 150,
                                width: 150,
                              ),
                              SizedBox(width: 10.0),

                            ]),
                      ),
                    ),
                    RaisedButton(
                        child: Text("Pick"),
                        onPressed: () {
                        //  takeCoverPhoto();
                        }),
                    RaisedButton(
                        child: Text("Save"),
                        onPressed: () {
                        //  SaveImage(_image.path);
                        }),
                    VerticalDivider(),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      child: Row(children: [
                        Icon(Icons.add_location),
                        Text("${city}"),
                      ]),
                      onTap: () {
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Map(text: "${city}"),
                            ));*/
                      },
                    ),

                  ]),
                ),
              ),/*
          _imagepath!=null
              ?FileImage(File(_imagepath))
              :CircleAvatar(
            radius:80,
            backgroundImage:_image=null
                ?FileImage(_image)
                :AssetImage("assets/architect.jpg"),*/
              Divider(),
              Flexible(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: _itemsJson.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = _itemsJson[index];
                      return Card(
                          elevation: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network("${item['image']}",
                                  width: 100, height: 100, fit: BoxFit.fill),
                              ListTile(
                                isThreeLine: true,
                                title: Text("Item name:${item['itemname']}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Description:${item['description']}"),
                                    Text("Price:${item['price']}"),
                                    Text("Type:${item['category']}"),
                                  ],
                                ),
                                trailing: GestureDetector(
                                child: Icon(
                                FontAwesomeIcons.trash,
                                size: 20.0,
                                color: Colors.brown[900],
                              ),
                                  onTap: () {
                                    //_onDeleteItemPressed(index);
                                  },
                              ),)
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString("imagepath");
    setState(() {
      _imagepath = pref.getString("imagepath");
    });
  }
}
