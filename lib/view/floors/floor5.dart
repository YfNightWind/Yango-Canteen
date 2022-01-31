import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class FloorFive extends StatefulWidget {
  const FloorFive({Key? key}) : super(key: key);

  @override
  _FloorFiveState createState() => _FloorFiveState();
}

class _FloorFiveState extends State<FloorFive> {
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
    // showMenuDetails();
    super.initState();
  }

  Future getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 5,
    });
    setState(() {
      showRestaurant = result.data["data"];
    });
    print(showRestaurant);
  }

  Future showMenuDetails() async {
    var name = await Global.getInstance()!.dio.post(
      '/menu/getMenuName',
      data: {"restaurant": temp},
    );
    var price = await Global.getInstance()!.dio.post(
      '/menu/getMenuPrice',
      data: {"restaurant": temp},
    );
    var category = await Global.getInstance()!.dio.post(
      '/menu/getMenuCategory',
      data: {"restaurant": temp},
    );
    if (this.mounted) {
      setState(() {
        showMenuName = name.data["data"];
        showMenuPrice = price.data["data"];
        showMenucategory = category.data["data"];
      });
    }
  }

  Future<Widget> showListData() async {
    return ListView.separated(
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
    );
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
                  child: FutureBuilder<Widget>(
                    future: showListData(),
                    initialData: CupertinoActivityIndicator(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data;
                      } else if (snapshot.hasError) {
                        return CupertinoActivityIndicator();
                      } else {
                        return snapshot.data;
                      }
                    },
                  ),
                ),
                Container(
                  height: 690,
                  width: 260,
                  child: FutureBuilder(
                    future: showMenuDetails(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? ListView.builder(
                              itemCount: showMenuName!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  margin: EdgeInsets.only(top: 10, left: 5),
                                  child: ListTile(
                                    title: Text(
                                      showMenuName![index].toString(),
                                    ),
                                    subtitle: Text(
                                        showMenuPrice![index].toString() + "元"),
                                    onTap: () {},
                                  ),
                                );
                              },
                            )
                          : new Text(
                              "点击任何一个店铺查看菜品",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
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
