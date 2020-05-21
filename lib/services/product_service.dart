import 'dart:convert';

import 'package:ui_design/models/api_response.dart';
import 'package:ui_design/models/product.dart';
import 'package:ui_design/models/product_for_listing.dart';
import 'package:ui_design/models/product_update.dart';

import 'package:http/http.dart' as http;

class ProductService {

  static const API = 'https://yndapi.azurewebsites.net/api';
  static const _apiName = 'Products';
  static const headers = {
    'accept': 'text/plain',
    'Content-Type': 'application/json'
  
  }; 

  Future<APIResponse<List<ProductForListing>>> getProductsList(){
    return http.get(API + '/' + _apiName , headers: headers)
    .then((data){
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final products = <ProductForListing>[];
        for (var item in jsonData) {
          products.add(ProductForListing.fromJson(item));
        }
        return APIResponse<List<ProductForListing>>(data: products);
      }
      return APIResponse<List<ProductForListing>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<List<ProductForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Product>> getProduct(int rowID){
    return http.get(API + '/' + _apiName + '/' + rowID.toString(), headers: headers)
    .then((data){
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Product>(data: Product.fromJson(jsonData));
      }
      return APIResponse<Product>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<Product>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createProduct(ProductManipulation item){
    return http.post(API + '/' + _apiName + '/' , headers: headers, body: json.encode(item.toJson()))
    .then((data){
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateProduct(int rowID, ProductManipulation item){
    return http.put(API + '/' + _apiName + '/' + rowID.toString() , headers: headers, body: json.encode(item.toJson()))
    .then((data){
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) =>  APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteProduct(int rowID) {
    return http.delete(API + '/' + _apiName + '/' + rowID.toString(), headers: headers).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}