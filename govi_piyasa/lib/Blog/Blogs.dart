
import 'package:flutter/material.dart';
import 'package:govi_piyasa/CustumWidget/BlogCard.dart';
import 'package:govi_piyasa/Model/SuperModel.dart';
import 'package:govi_piyasa/Model/addBlogModels.dart';

import '../NetworkHandler.dart';
import 'Blog.dart';

class Blogs extends StatefulWidget {
  Blogs({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  NetworkHandler networkHandler = NetworkHandler();
  SuperModel superModel = SuperModel();
  List<AddBlogModel> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get(widget.url);
    superModel = SuperModel.fromJson(response);
    setState(() {
      data = superModel.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return data.length > 0
        ? Column(
      children: data
          .map((item) => Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contex) => Blog(
                        addBlogModel: item,
                        networkHandler: networkHandler,
                      )));
            },
            child: BlogCard(
              addBlogModel: item,
              networkHandler: networkHandler,
            ),
          ),
          SizedBox(
            height: 0,
          ),
        ],
      ))
          .toList(),
    )
        : Center(
      child: Text("We don't have any Blog Yet"),
    );
  }
}