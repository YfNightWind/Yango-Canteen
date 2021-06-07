import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Text(
              '分类',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          GestureDetector(
            onTap: () {
              print("具体页面1");
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 350,
                margin: EdgeInsets.all(10),
                child: Text(
                  '按菜品查找',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              color: Colors.orange,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              print("具体页面2");
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 350,
                margin: EdgeInsets.all(10),
                child: Text(
                  '按楼层查找',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              color: Colors.blue,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
