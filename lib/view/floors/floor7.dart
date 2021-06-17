import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class FloorSeven extends StatefulWidget {
  const FloorSeven({Key? key}) : super(key: key);

  @override
  _FloorSevenState createState() => _FloorSevenState();
}

class _FloorSevenState extends State<FloorSeven> {
  var restaurantInfo;
  List? showRestaurant;

  @override
  void initState() {
    super.initState();
    getRestaurant();
  }

  Future getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 7,
    });
    setState(() {
      showRestaurant = result.data["result"];
    });
    print(restaurantInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showRestaurant!.length > 0
          ? ListView.builder(
              itemCount: showRestaurant!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(showRestaurant![index]["name"]),
                  onTap: () {},
                );
              },
            )
          : Text(""), //xx?xx:xx
    );
  }
}
