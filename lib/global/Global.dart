import 'package:dio/dio.dart';

class Global {
  static Global? _instance;
  late Dio dio;
  //构造方法
  static Global? getInstance() {
    if (_instance == null) _instance = new Global();
    return _instance;
  }
  //这样子构造避免每一次请求都new一个dio，省内存
  Global() {
    dio = new Dio();
    dio.options = BaseOptions(
      baseUrl: 'http://123.56.192.77:5050/',
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    //dio的监听事件
    dio.interceptors.add(InterceptorsWrapper(
        //   onRequest: (options, headers) {
        //   print("请求" + options.extra.toString());
        // }, onResponse: (e, headers) {
        //   print("返回" + e.toString());
        // },
        onError: (e, headers) {
      if (e.type == DioErrorType.connectTimeout) {
        print("连接超时");
      } else {
        print(e.error.toString());
      }
    }));
  }
}
