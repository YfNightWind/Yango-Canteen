import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class ShowMenuPage extends StatefulWidget {
  final List<Widget> widgets = [
    FlutterView(),
    AndroidView(),
    IosView(),
    FlutterView1(),
    AndroidView1(),
    IosView1()
  ];
  @override
  _ShowMenuPageState createState() => _ShowMenuPageState();
}

class _ShowMenuPageState extends State<ShowMenuPage>
    with SingleTickerProviderStateMixin {
  List tabs = ['Flutter', 'Android', 'iOS', 'Flutter1', 'Android1', 'iOS1'];
  int _index = 0;
  late TabController _controller;
  @override
  void initState() {
    _controller = new TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: _index,
    );
    _controller.addListener(() {
      setState(() {
        _index = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomizeAppBarLearn'),
        centerTitle: true,
        elevation: 10,
        bottom: TabBar(
          controller: _controller,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        children: widget.widgets,
        controller: _controller, //添加滑动效果
      ),
    );
  }
}

class FlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.grey,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AndroidView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Text('Android'),
      Text('Android'),
      Text('Android'),
      Text('Android'),
      Text('Android'),
    ]);
  }
}

class IosView extends StatelessWidget {
  final List restaurantInfo = jsonDecode(getRestaurant().toString())["result"];

  static getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 7,
    });
    print(result.runtimeType.toString()) ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text('333'),
          onPressed: () {
            getRestaurant();
          }),
    );
  }
}

class FlutterView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Flutter'),
    );
  }
}

class AndroidView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Android'),
    );
  }
}

class IosView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('iOS'),
    );
  }
}
