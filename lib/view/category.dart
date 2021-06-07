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
              style: TextStyle(fontSize: 40,),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: Container(
              height: 180,
              width: 350,
              color: Colors.orange,
              margin: EdgeInsets.all(10),
            ),
            elevation: 10,
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            child: Container(
              height: 180,
              width: 350,
              color: Colors.blue,
              margin: EdgeInsets.all(10),
            ),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}
