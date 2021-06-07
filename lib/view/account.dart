import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45,left: 30),
            child: Text(
              '个人中心',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            //❗有待完成这个onTap
            onTap: () => print("跳转到用户个人自定义，这个功能有待完成"),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.all(20),
              child: Container(
                width: 400,
                height: 150,
                child: ListTile(
                  leading: FlutterLogo(
                    size: 100,
                  ),
                  contentPadding: EdgeInsets.only(left: 10, top: 30),
                  title: Text(
                    'username',
                    style: TextStyle(fontSize: 30, height: 1.8),
                  ),
                  minVerticalPadding: -10,
                  subtitle: Text('这是一个测试', style: TextStyle(fontSize: 16, height: 1.5)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
