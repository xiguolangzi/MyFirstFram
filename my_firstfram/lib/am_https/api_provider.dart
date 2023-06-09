import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:my_firstfram/ab_log/log_driver.dart';

class ApiProvider {
  var logs = CustomPrinter.logging(ApiProvider);
  // 创建 dio 实例
  final dio = Dio();

  void configureDio() {
    // 修改 options 默认配置
    // _dio.options.baseUrl = "https://api.pub.dev";
    // _dio.options.connectTimeout = const Duration(seconds: 5);
    // _dio.options.receiveTimeout = const Duration(seconds: 5);

    // 设置代理
    // final httpClient = HttpClient();
    // httpClient.findProxy = (url) {
    //   return 'http://.example.com:8080';
    // };
    // dio.httpClientAdapter = IOHttpClientAdapter (Client: httpClient);
    dio.httpClientAdapter = IOHttpClientAdapter(
      onHttpClientCreate: (client) {
        final httpClient = HttpClient();
        httpClient.findProxy = (url) {
          // 将请求代理至 localhost:8080
          return 'PROXY localhost:8080';
        };
      },
    );

    // 添加拦截器
    dio.interceptors.add(DioInterceptors());

    final myOptions = BaseOptions(
      // 默认设置
      baseUrl: "https://api.pub.dev",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      // 请求头设置
      headers: {
        'Authorization': 'Bearer your_token_here',
        'Content-Type': 'application/json',
      },
    );
  }

  // 配置dio - 请求头

  // 配置dio - 响应处理

  // get 请求
  Future<Response> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } catch (e) {
      logs.e(e);
      throw Exception('Failed to make GET request: $e');
    }
  }

  // post 请求
  Future<Response> post(String url, dynamic data) async {
    try {
      final response = await dio.post(url, data: data);
      return response;
    } catch (e) {
      logs.e(e);
      throw Exception('Failed to make GET request: $e');
    }
  }

  // put 请求

  // delete 请求
}

// 拦截器
class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // token验证
    const token = 'your_token';
    options.headers['Authorization'] = 'Bearer $token';
    print('Sending request: ${options.uri}');
    handler.next(options); // 继续发送请求
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 在接收到响应后执行的操作，例如打印响应信息
    print('Received response: ${response.data}');
    handler.next(response); // 继续处理响应
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 在请求发生错误时执行的操作
    print('Error occurred: ${err.message}');
    handler.next(err); // 继续处理错误
  }
}
