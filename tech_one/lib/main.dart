
// JSON VALUE: must be one of the following
// a string , a number, an object, an array, a boolean, null

// json data return as name value pair

// JSON OBJECT: these {} represent json object its could be int, string or bool etc.

// Nested Json Object: nested in another object.

// JSON ARRAYS  represented by [].
import 'package:flutter/material.dart';
import 'package:tech_one/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

