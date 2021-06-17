import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class FloorFive extends StatefulWidget {
  const FloorFive({ Key? key }) : super(key: key);

  @override
  _FloorFiveState createState() => _FloorFiveState();
}

class _FloorFiveState extends State<FloorFive> {
  var restaurantInfo;
  List? showRestaurant;

  @override
  void initState() {
    super.initState();
    getRestaurant();
  }

  Future getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 5,
    });
    setState(() {
      showRestaurant = result.data["result"];
    });
    print(restaurantInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 690,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: showRestaurant!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(showRestaurant![index]["name"]),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}