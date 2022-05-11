
import 'package:dio/dio.dart';

class ShopService{
  Dio dio =new Dio();
  addShop(shopName,sellerName, phoneNo,email,city,address)async{
    return await dio.post('https://govi-piyasa-v-0-1.herokuapp.com/api/v1/shops',data:{
      "shopName":shopName,
      "sellerName":sellerName,
      "contactNumber":phoneNo,
      "email":email,
      "city":city,
      "address":address,

    },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}