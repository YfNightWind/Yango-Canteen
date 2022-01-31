import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yangocanteen/global/Global.dart';

class FloorTwo extends StatefulWidget {
  const FloorTwo({Key? key}) : super(key: key);

  @override
  _FloorTwoState createState() => _FloorTwoState();
}

class _FloorTwoState extends State<FloorTwo> {
  var restaurantInfo;
  List? showRestaurant;
  List? showMenuName;
  List? showMenuPrice;
  List? showMenuCategory;
  List? showFirstMenuName;
  List? showFirstMenuPrice;
  List? showFirstMenuCategory;
  var temp; //用于获取点击列表后的店名，以此来渲染右边的数据的请求
  var restaurantName;

  @override
  void initState() {
    getRestaurant();
    getFirstItem();
    // showMenuDetails();
    super.initState();
  }

  Future getRestaurant() async {
    var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 2,
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
    // if (this.mounted) {
      setState(() {
        showMenuName = name.data["data"];
        showMenuPrice = price.data["data"];
        showMenuCategory = category.data["data"];
      });
    // }
  }

  Future getFirstItem() async {
    var restaurant =
        await Global.getInstance()!.dio.post('/restaurant/get', data: {
      "floor": 2,
    });
    var firstRestaurant = restaurant.data["data"][0]["name"];
    print("第一个餐厅:" + firstRestaurant);
    var firstItemName = await Global.getInstance()!.dio.post(
      '/menu/getMenuName',
      data: {"restaurant": firstRestaurant},
    );
    var firstItemPrice = await Global.getInstance()!.dio.post(
      '/menu/getMenuPrice',
      data: {"restaurant": firstRestaurant},
    );
    var firstItemCategory = await Global.getInstance()!.dio.post(
      '/menu/getMenuCategory',
      data: {"restaurant": firstRestaurant},
    );

    // if (this.mounted) {
      setState(() {
        showMenuName = firstItemName.data["data"];
        showMenuPrice = firstItemPrice.data["data"];
        showMenuCategory = firstItemCategory.data["data"];
      });
    // }
  }

  Future<Widget> showMenuDetails2() async {
    return ListView.builder(
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
            subtitle: Text(showMenuPrice![index].toString() + "元"),
            onTap: () {},
          ),
        );
      },
    );
  }

  Future<Widget> showMenuDetails3() async {
    return ListView.builder(
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
              showFirstMenuName![index].toString(),
            ),
            subtitle: Text(showFirstMenuPrice![index].toString() + "元"),
            onTap: () {},
          ),
        );
      },
    );
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
                  child: FutureBuilder<Widget>(
                    future: showMenuDetails2(),
                    // initialData: showMenuDetails(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data;
                      } else if (snapshot.hasError) {
                        return CupertinoActivityIndicator();
                      } else {
                        return snapshot.data;
                      }
                    },
                    // future: showMenuDetails(),
                    // initialData: getFirstItem(),
                    // builder: (context, snapshot) {
                    //   return snapshot.connectionState == ConnectionState.none
                    //       ? CupertinoActivityIndicator()
                    //       : ListView.builder(
                    //           itemCount: showMenuName!.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return Card(
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(20),
                    //                 ),
                    //               ),
                    //               margin: EdgeInsets.only(top: 10, left: 5),
                    //               child: ListTile(
                    //                 title: Text(
                    //                   showMenuName![index].toString(),
                    //                 ),
                    //                 subtitle: Text(
                    //                     showMenuPrice![index].toString() + "元"),
                    //                 onTap: () {},
                    //               ),
                    //             );
                    //           },
                    //         );
                    // },
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
