import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
        elevation: 10,
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

enum ChosingCharacter { student, manger }

class _RegisterFormState extends State<RegisterForm> {
  ChosingCharacter _character = ChosingCharacter.student;
  final _user = new TextEditingController();
  final _pass = new TextEditingController();
  final _passConfirm = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名不能超过15个字符哦',
                prefixIcon: Icon(Icons.person_add_alt_1)),
                controller: _user,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
                labelText: '密码',
                hintText: '密码位数在5~20之间哦',
                prefixIcon: Icon(Icons.lock_open)),
                controller: _pass,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
                labelText: '确认密码',
                hintText: '确认您的密码！',
                prefixIcon: Icon(Icons.lock_outline)),
                controller: _passConfirm,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            child: Column(
              children: [
                RadioListTile<ChosingCharacter>(
                  title: Text('学生'),
                  value: ChosingCharacter.student,
                  groupValue: _character,
                  //根据平台来选择显示位置
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged: (ChosingCharacter? value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
                RadioListTile<ChosingCharacter>(
                  title: Text('店家'),
                  subtitle: Text('店家管理功能目前未完成，请勿选择❗'),
                  value: ChosingCharacter.manger,
                  groupValue: _character,
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged: (ChosingCharacter? value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            child: Container(
              height: 43,
              width: 200,
              child: ElevatedButton(
                child: Text(
                  '成为我们的朋友！',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17))),
                    elevation: MaterialStateProperty.all(10)),
                onPressed: () {
                  _submit();
                },
              ),
            ))
      ],
    );
  }

  void _submit(){

  }
}
