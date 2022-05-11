import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:govi_piyasa/Information/newsinfo.dart';
import 'package:govi_piyasa/Information/styles.dart';
import 'package:govi_piyasa/checkout/widgets/todo.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Todoscreen extends StatefulWidget {

  @override
  _TodoscreenState createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {

  final url = "https://mongoapi3.herokuapp.com/items";
  var _itemsJson = [];
  final List<Todo> products=[];
  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _itemsJson = jsonData;
       // products=jsonData;
      });
    } catch (err) {}
  }

  void initState() {
    super.initState();
    fetchPosts();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
        body: ListView.builder(
            itemCount: this.products.length,
            itemBuilder: _listViewItemBuilder
        )
    );
  }
  Widget _listViewItemBuilder(BuildContext context, int index){
    var newsDetail = this.products[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(newsDetail),
        title: _itemTitle(newsDetail),
        onTap: (){
          _navigationToNewsDetail(context, newsDetail);
        });
  }

  void _navigationToNewsDetail(BuildContext context, Todo newsDetail){
   /* Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context){return NewsInfo(newsDetail);}
        ));*/
  }

  Widget _itemThumbnail(Todo newsDetail){
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.image == null ? null : Image.network(newsDetail.image, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(Todo newsDetail){
    return Text(newsDetail.itemname, style: Styles.textDefault);
  }
  void getNews() async{
    final http.Response response = await http.get("https://mongoapi3.herokuapp.com/items");
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['result'].forEach((newsDetail) {
      final Todo news = Todo(
          itemname: newsDetail['itemname'],
          price: newsDetail['price'],
          category: newsDetail['category'],
        description:newsDetail['description'],
        image:newsDetail['image']

      );
      setState(() {
        products.add(news);
      });
    });
  }
}
