import 'dart:async';
import 'dart:io';

import 'package:task_one/product/models/product_model.dart';
import 'package:task_one/utilities/rest_api_utilitis.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  static var client = http.Client();
  static var duration = const Duration(seconds: 10);

  static Future<List<ModelPost>> loadProducts() async {
    List<ModelPost> list = [];
    try {
      Map<String, String> header = {};
      Map<String, String> body = {};

      http.Response response = await client
          .get(Uri.parse(RestApiUtils.productUrl))
          .timeout(duration);
      RestApiUtils.getResponseHeaderody(
          RestApiUtils.productUrl, header, body, response);

      if (response.statusCode == 200) {
        list = modelPostFromMap(response.body);
        return list;
      } else {
        return list;
      }
    } on TimeoutException {
      print("TimeoutException error!");
      return list;
    } on SocketException {
      print("SocketException error!");
      return list;
    } catch (e) {
      print("unkown error : ${e.toString()}");
      return list;
    }
  }
}
