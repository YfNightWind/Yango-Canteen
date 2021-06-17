import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FloorTwo extends StatefulWidget {
  const FloorTwo({Key? key}) : super(key: key);

  @override
  _FloorTwoState createState() => _FloorTwoState();
}

class _FloorTwoState extends State<FloorTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
      ),
    );
  }
}
