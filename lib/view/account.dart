import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 45, left: 30),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      Global.getInstance()!.user!["username"],
                      style: TextStyle(fontSize: 30, height: 1.8),
                    ),
                    minVerticalPadding: -10,
                    subtitle: Text(
                      '这是一个测试!',
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 10),
              child: ListTile(
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
                title: Text('我的喜欢', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 10),
              child: ListTile(
                leading: Icon(
                  Icons.comment,
                  color: Colors.blue.shade700,
                  size: 30,
                ),
                title: Text('我的评论', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/feedback');
        },
        child: Text(
          '反馈',
          style: TextStyle(fontSize: 17),
        ),
        //防止报错There are multiple heroes that share the same tag within a subtree.
        heroTag: 'other',
      ),
    );
  }
}
