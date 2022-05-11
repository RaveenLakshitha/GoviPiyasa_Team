import 'package:dio/dio.dart';

class Itemservice {
  Dio dio = new Dio();
  addItem(Name, designation, price, qty, category) async {
    return await dio.post('https://mongoapi3.herokuapp.com/additem',

        data: {
          "itemname": Name,
          "description": designation,
          "price":price,
          "quantity":qty,
          "category": category
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
