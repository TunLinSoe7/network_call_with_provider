import 'package:network_call_provider/network/api/product_api.dart';
import 'package:network_call_provider/network/product_response/response.dart';

class ProductModel{
  ProductModel._();
  static final ProductModel _singleton = ProductModel._();
  factory ProductModel()=>_singleton;

  final ProductApi _productApi = ProductApi();
  Future<List<ProductResponse>?> getProductResponse()=>_productApi.fetchProduct();
}