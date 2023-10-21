import 'package:task_one/utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RestApiUtils {
  static String url = "https://fakestoreapi.com/";

  static String productUrl = "${url}products";

  static const error_200 = "Succces";
  static const error_404 = "Succces";
  static const unknownError = "Succces";
  static String getResponseError(int status) {
    switch (status) {
      case 404:
        return error_404;
      case 200:
        return error_200;
      default:
        return unknownError;
    }
  }

  static void getResponseHeaderody(url, header, body, response) {
    print("GetResponse : url:$url");
    print("GetResponse : header:$header");
    print("GetResponse : body:$body");
    print(
        "GetResponse : statusCode :${response.statusCode}: body:,${response.body}");
  }

  static Widget showloadingView(BuildContext context) {
    return Container(
      height: 145,
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Lottie.asset(AppAssets.loading_three),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Loading",
          style: TextStyle(fontSize: 16),
        )
      ]),
    );
  }

  static showloadingViewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: showloadingView(context),
      ),
    );
  }

  static Widget showMessageView(
      BuildContext context, String path, String title) {
    return Container(
      alignment: Alignment.center,
      child: Column(children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Lottie.asset(path),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        )
      ]),
    );
  }

  static Widget showErroeWithReloadView(BuildContext context) {
    return const SizedBox();
  }
}
