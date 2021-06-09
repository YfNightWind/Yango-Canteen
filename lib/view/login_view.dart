import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:yangocanteen/viewmodel/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _user = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  void dispose() {
    _user.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎使用'),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '账号',
                  hintText: '请输入用户名',
                  prefixIcon: Icon(Icons.person),
                  //可以的话有内容再显示该图标☕
                  // suffixIcon: Icon(Icons.cancel),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: _user,
                textInputAction: TextInputAction.next,
                // autofocus: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  prefixIcon: Icon(Icons.lock),
                  //可以的话有内容再显示该图标☕
                  // suffixIcon: Icon(Icons.cancel),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                controller: _password,
                textInputAction: TextInputAction.done,
                obscureText: true,
                onSubmitted: (string) {
                  print('object');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  child: Text(
                    "登录",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _showLoadingAnimation();
                    _login();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      elevation: MaterialStateProperty.all(10)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  child: Text(
                    '注册',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      elevation: MaterialStateProperty.all(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    context.read<LoginViewModel>().setIsLogin(true);
    new Timer(Duration(seconds: 3), () {
      // Navigator.pushNamed(context, '/home');
    });
  }

  void _showLoadingAnimation() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: LoadingIndicator(
              indicatorType: Indicator.pacman,
              color: Colors.orange,
            ),
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            elevation: 0,
          );
        });
  }
}
