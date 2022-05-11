import 'package:blogapp/Forum/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'category.dart';



class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePostState();
  }
}

class _CreatePostState extends State<CreatePost> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> responseBody = Map();
  List<Category> categories = [];
  String selectedCategory = 'Uncategorized';
  String selectedId = '1';
  bool _isloading = true;
  Map<dynamic, dynamic> requestBody = Map();
  String _title;
  String _description;
  Map<String, String> headers;

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  getCategories() async {
    http.Response response =
    await http.get(Constants.SERVER_URL + 'categories.json');
    responseBody = json.decode(response.body);
    responseBody['category_list']['categories'].forEach((category) {
      categories
          .add(Category(id: category['id'].toString(), name: category['name']));
    });
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                buildTitleField('Type title/paste a link here *'),
                buildCategoryField('Select Category'),
                buildDescriptionField('Description *'),
                createPostButton()
              ],
            ),
          ),
        ));
  }

  Widget buildTitleField(String label) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title cannot be empty';
        } else if (value.length < 15) {
          return 'Title should be atleast 15 characters long';
        }
      },
      decoration: InputDecoration(
        labelText: label,
      ),
      onSaved: (String value) {
        setState(() {
          _title = value;
        });
      },
    );
  }

  Widget createPostButton() {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Create Post',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.create,
            size: 20,
          )
        ],
      ),
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        }
        _formKey.currentState.save();
        postTopic(context);
      },
    );
  }

  Widget buildDescriptionField(String label) {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description cannot be empty';
        } else if (value.length < 20) {
          return 'Title should be atleast 20 characters long';
        }
      },
      decoration: InputDecoration(labelText: label),
      maxLines: 10,
      onSaved: (String value) {
        setState(() {
          _description = value;
        });
      },
    );
  }

  Widget buildCategoryField(String label) {
    List<Widget> getActions() {
      List<Widget> actions = [];
      if (_isloading) {
        actions = [];
        actions.add(Container(
            padding: EdgeInsets.all(10),
            child: Center(child: CircularProgressIndicator())));
      } else {
        actions = categories.map((item) {
          return CupertinoActionSheetAction(
            child: Text(
              item.name,
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () {
              Navigator.pop(context, item.name);
            },
          );
        }).toList();
      }

      return actions;
    }

    return GestureDetector(
        onTap: () {
          containerForSheet<String>(
            context: context,
            child: CupertinoActionSheet(
              title: const Text('Select State'),
              actions: getActions(),
            ),
          );
        },
        child: Container(
            color: Colors.white,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Select Category *',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 16),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: IconButton(
                            onPressed: () {
                              containerForSheet<String>(
                                context: context,
                                child: CupertinoActionSheet(
                                  title: const Text('Select Category'),
                                  actions: getActions(),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 30,
                          ))
                    ],
                  ),
                  Container(
                    child: Text(
                      selectedCategory,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 40,
                  )
                ])));
  }

  void containerForSheet<Map>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<Map>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((Map value) {
      setState(() {
        if (value == null) {
          selectedCategory = '';
        } else {
          selectedCategory = value.toString();
          categories.forEach((category) {
            if (category.name == value.toString()) {
              selectedId = category.id;
            }
          });
        }
      });
    });
  }

  postTopic(BuildContext context) async {
    setState(() {
      requestBody = {
        'title': _title,
        'raw': _description,
        'category': selectedId.toString(),
      };
      headers = {
        'Api-key':
        '3e639c29966434189049ff773351e447478cdca35a1cbba845d10bf117698de8',
        'Api-Username': 'sakina'
      };
    });

    http.Response response = await http.post(
        Constants.SERVER_URL + 'posts.json',
        headers: headers,
        body: requestBody);
    responseBody = json.decode(response.body);
    print(responseBody);
    if (responseBody.containsKey('errors')) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Errors found'),
                actions: <Widget>[
                  FlatButton(
                    // color: Colors.blue,
                    child: Text('Okay'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
                content: Text(responseBody['errors'][0]));
          });
    } else if (responseBody.containsKey('error')) {
      return AlertDialog(
          title: Text('Errors found'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () => Navigator.pop(context),
            )
          ],
          content: Text('Please check the fields and Try Again'));
    } else {
      Navigator.pop(context);
    }
  }
}
