//用于访问后台的登录接口
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false;
  //每次获取给_isLogin设置新的值
  bool get getIsLogin {
    return _isLogin;
  }

  // TextEditingController get getUser {
  //   if (_user == null) _user = TextEditingController();
  //   return _user;
  // }

  void setIsLogin(bool value) {
    _isLogin = value;
    //刷新
    notifyListeners();
  }

  void login() async {
    setIsLogin(true);
  }
}
