import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Architect extends StatefulWidget {

  final String name;
  final String about;
  final String contact;
  final String team;

  // receive data from the FirstScreen as a parameter
  Architect({Key key, @required this.name,@required this.about,@required this.contact,@required this.team}) : super(key: key);
  @override
  _ArchitectState createState() => _ArchitectState();
}

class _ArchitectState extends State<Architect> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.name}"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        SizedBox(
                          height: 100,
                        ),
                        Image(
                          image: AssetImage("assets/architect.jpg"),
                          fit: BoxFit.contain,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            SizedBox(height: 10,),
                            Text("Profilename:${widget.name}"),
                            Text("About:${widget.about}"),
                            Text("Contact:${widget.contact}"),
                            Text("Team:${widget.team}"),

                          ]

                        )

                      ]

                  ),

                ),
              ),
              Container(
                child:Card(

                  child:Text("Designs"),
                ),

              ),
              Divider(),
              Flexible(
                child: ListView.builder(
                    itemCount: _itemsJson.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      final item = _itemsJson[index];
                      return ListTile(
                        isThreeLine: true,
                        leading: Image.network("${item['image']}"),
                        title: Text("Item name:${item['itemname']}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Description:${item['description']}"),
                            Text("Price:${item['price']}"),
                            Text("Type:${item['category']}"),
                          ],
                        ),
                        onTap: () {
                          //   setState(() {
                          _itemsJson.removeAt(index);
                          // });

                        },
                      );


                    }


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
