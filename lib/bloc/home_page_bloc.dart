import 'package:flutter/foundation.dart';
import 'package:network_call_provider/network/product_response/response.dart';
import '../data/model/product_model.dart';

class HomePageBloc extends ChangeNotifier{
  List<ProductResponse>? getProductResponse;
  bool isDispose = false;
  ProductModel productModel = ProductModel();
  HomePageBloc(){
    productModel.getProductResponse().then((value) {
      getProductResponse = value;
      notifyListeners();
    });
  }
  @override
  void dispose() {
    isDispose  = true;
    super.dispose();
  }
  @override
  void notifyListeners() {
    if(!isDispose){
      super.notifyListeners();
    }
  }
}