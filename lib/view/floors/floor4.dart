import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class FloorFour extends StatefulWidget {
  const FloorFour({Key? key}) : super(key: key);

  @override
  _FloorFourState createState() => _FloorFourState();
}

class _FloorFourState extends State<FloorFour> {
  var restaurantInfo;
  List? showRestaurant;
  List? showMenuName;
  List? showMenuPrice;
  List? showMenucategory;
  var temp; //用于获取点击列表后的店名，以此来渲染右边的数据的请求
  var restaurantName;

  @override
  void initState() {
    getRestaurant();
    showMenuDetails();
    super.initState();
  }

  Future getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 4,
    });
    setState(() {
      showRestaurant = result.data["result"];
    });
    print(showRestaurant);
  }

  showMenuDetails() async {
    var name = await Global.getInstance()!.dio.post(
      '/menu/getall/name',
      data: {"restaurant": temp},
    );
    var price = await Global.getInstance()!.dio.post(
      '/menu/getall/price',
      data: {"restaurant": temp},
    );
    var category = await Global.getInstance()!.dio.post(
      '/menu/getall/category',
      data: {"restaurant": temp},
    );
    if (this.mounted) {
      setState(() {
        showMenuName = name.data["result"];
        showMenuPrice = price.data["result"];
        showMenucategory = category.data["result"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        onTap: () {
                          setState(() {
                            temp = showRestaurant![index]["name"].toString();
                            print(temp);
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  height: 690,
                  width: 285,
                  child: FutureBuilder(
                    future: showMenuDetails(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                        itemCount: showMenuName!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            margin: EdgeInsets.only(top: 10, left: 5),
                            child: ListTile(
                              title: Text(showMenuName![index]["name"]),
                              subtitle:
                                  Text(showMenuPrice![index]["price"] + "元"),
                              onTap: () {},
                            ),
                          );
                        },
                      );
                    },
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
