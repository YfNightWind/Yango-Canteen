import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("欢迎管理员"),
        centerTitle: true,
      ),
      body: AdminBody(),
    );
  }
}

class AdminBody extends StatefulWidget {
  const AdminBody({Key? key}) : super(key: key);

  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/insertmenu");
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 350,
                margin: EdgeInsets.all(10),
                child: Text(
                  "添加菜品",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              color: Colors.orange,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/deletemenu");
            },
          )
        ],
      ),
    );
  }
}
