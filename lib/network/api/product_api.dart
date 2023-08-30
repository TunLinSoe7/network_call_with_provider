import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:network_call_provider/constant/api_constant.dart';
import 'package:network_call_provider/network/product_response/response.dart';

class ProductApi{
  ProductApi._();
  factory ProductApi()=>_singleton;
  static final ProductApi _singleton = ProductApi._();

  Future<List<ProductResponse>?> fetchProduct()async{
    final response = await http.get(Uri.parse(kBaseUrl+kProductEndPoint));
    if(response.statusCode==200){
      print("code==============>${response.statusCode}");
      List<dynamic> jsonData  =json.decode(response.body);
      return jsonData.map((e) =>ProductResponse.fromJson(e)).toList();
    }else{
      throw Exception("fail to load data");
    }
  }
}
