import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? img = [
    "http://114.215.209.136:5050/images/jm1.jpg",
    "http://114.215.209.136:5050/images/jm2.jpg",
    "http://114.215.209.136:5050/images/jm3.jpg",
  ];
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
                '首页',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 400,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    img![index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: img!.length,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  height: 150,
                  width: 400,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Text('这里显示的是最受欢迎的店铺，下一个版本更新',
                      style: TextStyle(fontSize: 25)),
                ))
          ],
        ),
      ),
    );
  }
}
