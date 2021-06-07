import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Text(
              '首页',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          Swiper(itemCount: 3)
        ],
      ),
    );
  }
}
