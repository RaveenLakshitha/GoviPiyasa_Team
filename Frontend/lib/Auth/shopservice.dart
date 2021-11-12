
import 'package:dio/dio.dart';

class ShopService{
  Dio dio =new Dio();
  addShop(shopName,sellerName,phoneNo,email,address,city) async {
    return await dio.post('https://mongoapi3.herokuapp.com/addshop',data:{
      "shopname":shopName,
      "sellername":sellerName,
      "contact":phoneNo,
      "email":email,
      "city":city,
      "address":address



    },
        options: Options(contentType: Headers.formUrlEncodedContentType)
    );
  }
  addArchitect(AName,designation,phoneNo,about,team) async {
    return await dio.post('https://mongoapi3.herokuapp.com/addarchitect',data:{
      "name":AName,
      "designation":designation,
      "contact":phoneNo,
      "about":about,
      "team":team



    },
        options: Options(contentType: Headers.formUrlEncodedContentType)
    );
  }
}
