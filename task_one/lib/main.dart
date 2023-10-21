import 'package:task_one/product/screens/home_screen.dart';
import 'package:task_one/task.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      // DevicePreview(
      //   enabled: true,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
