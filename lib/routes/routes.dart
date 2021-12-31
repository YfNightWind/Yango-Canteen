import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yangocanteen/view/Delete_Menu_Page.dart';
import 'package:yangocanteen/view/bottom_bar.dart';
import 'package:yangocanteen/view/InsertMenu.dart';
import 'package:yangocanteen/view/lost_and_found.dart';
import 'package:yangocanteen/view/show_menu.dart';
import 'package:yangocanteen/view/account.dart';
import 'package:yangocanteen/view/admin_page.dart';
import 'package:yangocanteen/view/feedback.dart';
import 'package:yangocanteen/view/login_page.dart';
import 'package:yangocanteen/view/register_page.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginPage(),
  "/account": (BuildContext context) => AccountPage(),
  "/feedback": (BuildContext context) => FeedBackPage(),
  "/home": (BuildContext context) => TabsPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/menu": (BuildContext context) => ShowMenuPage(),
  "/lostandfound": (BuildContext context) => LostAndFoundPage(),
  "/insertmenu": (BuildContext context) => InsertMenuPage(),
  "/deletemenu": (BuildContext context) => DeletePage(),
  "/admin": (BuildContext context) => AdminPage(),
};
