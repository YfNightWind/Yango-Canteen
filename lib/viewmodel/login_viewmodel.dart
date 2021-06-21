//用于访问后台的登录接口
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yangocanteen/model/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false;
  late TextEditingController? _user;
  late TextEditingController? _password;

  //每次获取给_isLogin设置新的值
  bool get getIsLogin {
    return _isLogin;
  }

  TextEditingController? get getUser {
    if (_user == null) _user = TextEditingController();
    return _user;
  }

  TextEditingController? get getPass {
    if (_password == null) _password = TextEditingController();
    return _password;
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    //刷新
    notifyListeners();
  }

  void login(context) async {
    setIsLogin(true);
    if (getUser!.text.isEmpty) {
      print("账号不能为空");
      setIsLogin(false);
      return;
    } else if (getPass!.text.isEmpty) {
      print("密码不能为空");
      setIsLogin(false);
      return;
    }
    Response result = await loginModel(getUser!.text, getPass!.text);
    if (result.data["code"]) {
      print(result.data["msg"]);
    } else {
      print(result.data["msg"]);
    }
    setIsLogin(false);
  }
}
