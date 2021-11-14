
import 'package:blogapp/Forum/post_details.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'create_post.dart';

class ListPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPostState();
  }
}

class _ListPostState extends State<ListPost> {
  Map<dynamic, dynamic> postListResponse;
  final String appUrl = 'https://flutterforum.co';

  void initState() {
    super.initState();
    getPostLists();
  }

  Size _deviceSize;

  getPostLists() async {
    await http.get(appUrl + '/posts.json').then((response) {
      setState(() {
        postListResponse = json.decode(response.body);
        print(postListResponse);
      });
    });
  }

  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text('Flutter Forum'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.create,
              ),
              onPressed: () {
                MaterialPageRoute createPost =
                MaterialPageRoute(builder: (context) => CreatePost());
                Navigator.push(context, createPost);
              },
            )
          ]
      ),
      body: postListResponse != null
          ? ListView.builder(
        itemCount: postListResponse["latest_posts"].length,
        itemBuilder: (BuildContext context, int index) {
          return postItem(index);
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget postItem(int index) {
    return GestureDetector(
        onTap: () {
          goToDetailsPage(postListResponse["latest_posts"][index]["topic_id"]);
        },
        child: Card(
            child: new Container(
                width: _deviceSize.width,
                margin: EdgeInsets.all(5),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        leading: profileLogo(postListResponse["latest_posts"]
                        [index]["avatar_template"]),
                        title: Text(
                            '${postListResponse["latest_posts"][index]["topic_title"]}'),
                        subtitle: Text(
                            '${postListResponse["latest_posts"][index]["name"]}'),
                        trailing: Text(
                            '${postListResponse["latest_posts"][index]["reply_count"]}'), //
                      ),
                    ]))));
  }

  Widget profileLogo(imageUrl) {
    return CircleAvatar(
      backgroundImage:
      NetworkImage(appUrl + imageUrl.replaceAll("{size}", "90")),
      backgroundColor: Colors.white,
      radius: 25.0,
    );
  }

  goToDetailsPage(topicId) {
    MaterialPageRoute postDetail =
    MaterialPageRoute(builder: (context) => PostDetail(topicId));
    Navigator.push(context, postDetail);
  }
}
