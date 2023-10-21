import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_ap3/products/model/model_post.dart';
import 'package:my_ap3/utilities/rest_api_utilities.dart';

class ServiceProduct {
  static var client = http.Client();
  static var duration = Duration(seconds: 10);

  static Future<List<ModelPost>> LoadProducts() async {
    List<ModelPost> list = [];
    try {
      Map<String, String> header = {};
      Map<String, String> body = {};

      var response = await client
          .get(Uri.parse(RestApiUtilities.product_url))
          .timeout(duration);

      RestApiUtilities.GetPrintHeaderBodyUrlResponse(
          RestApiUtilities.product_url, header, body, response);

      if (response.statusCode == 200) {
        list = modelPostFromMap(response.body);
        return list;
      } else {
        print("Error ssss - ${RestApiUtilities.GetResponseError(response.statusCode)}");
        return list;
      }
    } on TimeoutException {
      print(RestApiUtilities.GetResponseError(420));
      return list;
    } on SocketException {
      print(RestApiUtilities.GetResponseError(430));
      return list;
    } catch (e) {
      print("Error: ${e.toString()}");
      return list;
    }
  }
}
