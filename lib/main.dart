import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yangocanteen/routes/routes.dart';
import 'package:yangocanteen/viewmodel/login_viewmodel.dart';

final GlobalKey<NavigatorState>? navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  runApp(MultiProvider(
    //有用到providers的都需要这么写
    providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ],
    child: MyApp(),
  ));
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
          visualDensity: VisualDensity.adaptivePlatformDensity),
      routes: routes,
    );
  }
}
