import 'package:flutter/material.dart';
import 'package:yangocanteen/global/Global.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);
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
  //创建唯一标识 Form 小部件的全局键并允许验证表单。
  //Create a global key that uniquely identifies the Form widgetand allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  //焦点事件
  FocusNode _focusNode1 = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  @override
  void dispose() {
    contact.dispose();
    details.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sendInfo() async {
      await Global.getInstance()!.dio.post('/feedback/commit',
          data: {'contact': contact.text, 'feedback': details.text});
    }

    return Form(
      // autovalidateMode: AutovalidateMode.always,
      child: Column(
        key: _formKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              focusNode: _focusNode1,
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
              focusNode: _focusNode2,
              //验证器接收用户输入的文本。
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '这里不可以为空哦';
                }
                return null;
              },
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
              //这里必须要写Builder，原因如下（来自《Flutter实战》P121）：👇
              /*登录按钮的onPressed方法中不能通过Form.of(context)来获取，原因是，
              此处的context为FormTestRoute的context，而Form.of(context)是根据所指定context向根去查找，
              而FormState是在FormTestRoute的子树中，所以不行。正确的做法是通过Builder来构建登录按钮，
              Builder会将widget节点的context作为回调参数
               */
              child: Builder(builder: (context) {
                return ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {
                      //如果表单有效，Validate 返回 true，否则返回 false。
                      if (Form.of(context)!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('发送成功，感谢您的支持！')));

                        sendInfo();
                        _focusNode1.unfocus();
                        _focusNode2.unfocus();
                        contact.clear();
                        details.clear();
                      }
                    },
                    icon: Icon(Icons.send),
                    label: Text('发送'));
              }))
        ],
      ),
    );
  }
}
