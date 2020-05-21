import 'dart:convert';

import 'package:ui_design/models/api_response.dart';
import 'package:ui_design/models/purchase.dart';
import 'package:ui_design/models/purchase_for_listing.dart';
import 'package:ui_design/models/purchase_update.dart';

import 'package:http/http.dart' as http;

class PurchaseService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const _apiName = 'notes';
  static const headers = {
    'apiKey': 'd798eb38-1ba9-4a2a-996c-93deda3458e5',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<PurchaseForListing>>> getPurchasesList() {
    return http.get(API + '/' + _apiName, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final purchases = <PurchaseForListing>[];
        for (var item in jsonData) {
          purchases.add(PurchaseForListing.formJson(item));
        }
        return APIResponse<List<PurchaseForListing>>(data: purchases);
      }
      return APIResponse<List<PurchaseForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<PurchaseForListing>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Purchase>> getPurchase(String rowID) {
    return http.get(API + '/' + _apiName + '/' + rowID, headers: headers).then(
        (data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Purchase>(data: Purchase.formJson(jsonData));
      }
      return APIResponse<Purchase>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<Purchase>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createPurchase(PurchaseManipulation item) {
    return http
        .post(API + '/' + _apiName + '/',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updatePurchase(
      String rowID, PurchaseManipulation item) {
    return http
        .put(API + '/' + _apiName + '/' + rowID,
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deletePurchase(String rowID) {
    return http
        .delete(API + '/' + _apiName + '/' + rowID, headers: headers)
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
