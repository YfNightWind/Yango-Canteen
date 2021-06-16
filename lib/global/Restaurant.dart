import 'dart:convert';
import 'package:yangocanteen/global/Global.dart';

final List restaurantInfo = jsonDecode(getRestaurant().toString())["result"];

getRestaurant() async {
  var result = await Global.getInstance()!.dio.post('/restaurant/get', data: {
    "floor": 7,
  });
  return result;
}
