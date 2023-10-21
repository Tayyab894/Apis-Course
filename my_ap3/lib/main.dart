import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_ap3/products/model/model_post.dart';
import 'package:my_ap3/products/screens/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //  useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

