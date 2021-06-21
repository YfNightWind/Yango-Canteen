import 'package:yangocanteen/global/Global.dart';

Future loginModel(String user, String pass) async {
  return await Global.getInstance()!.dio.post(
    '/user/login',
    data: {"username": user, "password": pass},
  );
}
