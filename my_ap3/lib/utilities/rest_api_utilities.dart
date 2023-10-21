import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_ap3/utilities/app_assets.dart';

class RestApiUtilities {
  // static String url = "https://fakestoreapi.com/"; // production
  static String url = "https://fakestoreapi.com/"; // Dev

  static final String product_url = "${url}products";

  static final error_404 = "Resource not found";
  static final error_401 = "Unauthorize error";
  static final error_time_out = "Time out error";
  static final error_internet_issue = "you are not connected with internet";
  static final error_unknown = "Unknown error";

  static String GetResponseError(int status) {
    switch (status) {
      case 404:
        return error_404;

      case 401:
        return error_401;
      case 420:
        return error_time_out;
      case 430:
        return error_internet_issue;

      default:
        return error_unknown;
    }
  }

  static void GetPrintHeaderBodyUrlResponse(url, header, body, response) {
    print("GetResponse: url : $url");
    print("GetResponse: header : $header");
    print("GetResponse: body: $body");
    print("GetResponse: response : ${response.statusCode} , ${response.body}");
  }

  static Widget ShowLoadingView(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Lottie.asset(AppAssets.loading1),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Loading Data",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  static ShowLoadingViewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: ShowLoadingView(context),
      ),
    );
  }

  static Widget ShowMessageView(BuildContext context, String path, String title) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Lottie.asset(path),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  static Widget ShowErrorWithReloadView(BuildContext context, String path, String title, onTapp) {
    return Container(
      child: Column(
        children: [
          ShowMessageView(context, path, title),
         TextButton(
              onPressed: onTapp,
              child: Text("Reload"),
            )
        ],
      ),
    );
  }
}
