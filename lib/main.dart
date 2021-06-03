import 'package:flutter/material.dart';
import 'package:yangocanteen/routes/routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //设置视觉密度：适应平台密度
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      routes: routes,
    );
  }
}