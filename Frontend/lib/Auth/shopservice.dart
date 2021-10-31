
import 'package:dio/dio.dart';

class ShopService{
  Dio dio =new Dio();
  addShop(shopName,sellerName,phoneNo,email,address,city) async {
    return await dio.post('https://mongoapi3.herokuapp.com/adduser',data:{
      "shopname":shopName,
      "sellername":sellerName,
      "contact":phoneNo,
      "email":email,
      "city":city,
      "address":address,
      "password":address


    },
        options: Options(contentType: Headers.formUrlEncodedContentType)
    );
  }
}
