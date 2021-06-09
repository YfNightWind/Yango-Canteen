import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('欢迎使用'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
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
                  suffixIcon: Icon(Icons.cancel),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                textInputAction: TextInputAction.next,
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
                    suffixIcon: Icon(Icons.cancel),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                textInputAction: TextInputAction.done,
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
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                  ),
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
