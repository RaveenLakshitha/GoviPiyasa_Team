import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:govi_piyasa/Forum/post.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PostDetail extends StatefulWidget {
  int topic_id;
  PostDetail(this.topic_id);

  @override
  State<StatefulWidget> createState() {
    return _PostDetailState();
  }
}

class _PostDetailState extends State<PostDetail> {
  List<Post> posts = [];
  final String app_url = "https://flutterforum.co";
  bool _isLoading = true;
  String topic_title = "";

  @override
  void initState() {
    fetchPosts(widget.topic_id);
  }

  fetchPosts(topic_id) {
    Map<dynamic, dynamic> responseBody;
    posts = [];
    _isLoading = true;
    String url = "https://flutterforum.co/u/ashen_nilura/${topic_id}.json";
    print(url);
    http.get(url).then((response) {
      responseBody = json.decode(response.body);
      topic_title = responseBody['title'];
      responseBody['post_stream']['posts'].forEach((post) {
        print(post['display_username']);

        setState(() {
          posts.add(Post(
              id: post['id'],
              display_username: post['display_username'],
              cooked: post['cooked'],
              avatar_template: post['avatar_template']));
          _isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(topic_title),
        ),
        body: _isLoading ? Center(child: CircularProgressIndicator()) : get_post_widget()) ;
  }

  Widget get_post_widget(){
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return get_post(posts[index]);
      },
    );
  }

  Container get_post(Post post) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.7))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Image(image: NetworkImage(app_url + post.avatar_template.replaceAll("{size}", "50")))),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(post.display_username),
              )
            ],
          ),
          HtmlWidget(post.cooked)
        ],
      ),
    );
  }
}
