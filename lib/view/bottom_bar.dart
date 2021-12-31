import 'package:flutter/material.dart';
import 'package:yangocanteen/view/account.dart';
import 'package:yangocanteen/view/category.dart';
import 'package:yangocanteen/view/home.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({
    Key? key,
  }) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  List _pageList = [HomePage(), CategoryPage(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          child: Icon(this._currentIndex == 1
              ? Icons.category
              : Icons.category_outlined),
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor:
              this._currentIndex == 1 ? Colors.orange : Colors.amber.shade300,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        iconSize: 26,
        fixedColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(this._currentIndex == 0
                ? Icons.food_bank
                : Icons.food_bank_outlined),
            label: ("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(this._currentIndex == 1
                ? Icons.category
                : Icons.category_outlined),
            label: ("分类"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
                this._currentIndex == 2 ? Icons.person : Icons.person_outlined),
            label: ("个人中心"),
          )
        ],
      ),
    );
  }
}
