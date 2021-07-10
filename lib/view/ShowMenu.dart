import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';
import 'package:yangocanteen/view/floors/floor2.dart';
import 'package:yangocanteen/view/floors/floor3.dart';
import 'package:yangocanteen/view/floors/floor4.dart';
import 'package:yangocanteen/view/floors/floor5.dart';
import 'package:yangocanteen/view/floors/floor6.dart';
import 'package:yangocanteen/view/floors/floor7.dart';

class ShowMenuPage extends StatefulWidget {
  @override
  _ShowMenuPageState createState() => _ShowMenuPageState();
}

class _ShowMenuPageState extends State<ShowMenuPage>
    with SingleTickerProviderStateMixin {
  List<Widget> widgets = [
    FloorTwo(),
    FloorThree(),
    FloorFour(),
    FloorFive(),
    FloorSix(),
    FloorSeven(),
  ];
  List tabs = ['2楼', '3楼', '4楼', '5楼', '6楼', '7楼'];
  // int _index = 0;
  late TabController _controller;
  @override
  void initState() {
    _controller = new TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: GetTabIndex.getTabIndex,
    );
    _controller.addListener(() {
      setState(() {
        GetTabIndex.getTabIndex = _controller.index;
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
      appBar: PreferredSize(
        child: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Icon(
              Icons.food_bank,
              color: Colors.black,
              size: 45,
            ),
          ],
          bottom: TabBar(
              controller: _controller,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 17),
              indicatorColor: Colors.orange.shade500),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: TabBarView(
        children: widgets,
        controller: _controller, //添加滑动效果
      ),
    );
  }
}
