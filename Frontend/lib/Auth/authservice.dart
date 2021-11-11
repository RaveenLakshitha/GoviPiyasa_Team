import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Dio dio = new Dio();

  login(name, password) async {
    try {

      return await dio.post('https://govipiyasa.herokuapp.com/authenticate',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));

    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  addUser(name, password) async {
    return await dio.post('https://govipiyasa.herokuapp.com/adduser',
        data: {"name": name, "password": password},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

/*
  addShop(name, age) async {
    return await dio.post('http://localhost:5000/userTask/createUserTask',
        data: {"taskTitle": name, "taskDescription": age},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
  */
  getinfo(token)async {
    dio.options.headers['Authorization']='Bearer$token';
    return await dio.get('https://govipiyasa.herokuapp.com/authenticate');

  }
}
