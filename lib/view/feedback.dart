import 'package:flutter/material.dart';
import 'package:yangocanteen/global/Global.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('反馈'),
        centerTitle: true,
      ),
      body: FeedBackForm(),
    );
  }
}

class FeedBackForm extends StatefulWidget {
  @override
  FeedBackFormState createState() {
    return FeedBackFormState();
  }
}

class FeedBackFormState extends State<FeedBackForm> {
  final contact = TextEditingController();
  final details = TextEditingController();
  @override
  void dispose() {
    contact.dispose();
    details.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sendInfo() async {
      await Global.getInstance()!.dio.post('/feedback/commit', data: {'feedback': details.text});
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: contact,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: '告诉我们您的联系方式！(QQ/微信/手机/邮箱)',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: details,
            maxLines: 5,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: '告诉我们您的建议和问题！',
            ),
          ),
        ),
        //按钮
        Container(
          alignment: Alignment.bottomRight,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () {
                sendInfo();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('发送成功，感谢您的支持！')));
                contact.clear();
                details.clear();
              },
              icon: Icon(Icons.send),
              label: Text('发送')),
        )
      ],
    );
  }
}
