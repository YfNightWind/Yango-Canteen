import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yangocanteen/view/BottomBar.dart';
import 'package:yangocanteen/view/LostAndFound.dart';
import 'package:yangocanteen/view/ShowMenu.dart';
import 'package:yangocanteen/view/account.dart';
import 'package:yangocanteen/view/feedback.dart';
import 'package:yangocanteen/view/login_view.dart';
import 'package:yangocanteen/view/register_view.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginPage(),
  "/account": (BuildContext context) => AccountPage(),
  "/feedback": (BuildContext context) => FeedBackPage(),
  "/home": (BuildContext context) => TabsPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/menu": (BuildContext context) => ShowMenuPage(),
  "/lostandfound":(BuildContext context)=> LostAndFoundPage()
};
