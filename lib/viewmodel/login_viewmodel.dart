//用于访问后台的登录接口
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false;
  //每次获取给_isLogin设置新的值
  bool get getIsLogin {
    return _isLogin;
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    //刷新
    notifyListeners();
  }
}
