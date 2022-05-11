import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart'as http;

class Itemservice {
  Dio dio = new Dio();
  addItem(Name, designation, price, qty, category, deliverystatus) async {
    return await dio.post('https://mongoapi3.herokuapp.com/additem',

        data: {
          "itemname": Name,
          "description": designation,
          "price":price,
          "quantity":qty,
          "category": category,
          "deliverystatus": deliverystatus,


        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
  addQuestion(title,category,description,token) async {
    return await dio.post('https://mongoapi3.herokuapp.com/addposts',

        data: {
          "title": title,
          "category": category,
          "description": description,
          "currentid":token




        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
  String baseUrl = "https://mongoapi3.herokuapp.com/";

  Future<void> deleteUser({String id}) async {
    try {
      await dio.delete(baseUrl + '/item/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await http.delete(
      "$baseUrl/item/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<List> getPosts() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // return a decoded body
        return jsonDecode(response.body);
      } else {
        // server error
        return Future.error("Server Error !");
      }
    } catch (SocketException) {
      // fetching error
      // may be timeout, no internet or dns not resolved
      return Future.error("Error Fetching Data !");
    }
  }
  Future<String> createPost(Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse("$baseUrl/create"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        // server error
        return "err";
      }
    } catch (SocketException) {
      // fetching error
      return "err";
    }
  }
  /*
  Future<String> deletePost(Map<String, dynamic> data) async {
    try {
      var response = await http.delete(
        Uri.parse("$baseUrl/item/:id"),
        body: jsonEncode(data),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      //
      if (response.statusCode == 200) {
        return "success";
      } else {
        print(response.body);
        // server error
        return "err";
      }
    } catch (SocketException) {
      // fetching error
      return "err";
    }
  }*/
}

