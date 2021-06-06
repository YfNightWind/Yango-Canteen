import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yangocanteen/view/BottomBar.dart';
import 'package:yangocanteen/view/account.dart';

Map<String, WidgetBuilder> routes = {
  "/":(BuildContext context)=> TabsPage(),
  "/account":(BuildContext context)=> AccountPage(),
};
