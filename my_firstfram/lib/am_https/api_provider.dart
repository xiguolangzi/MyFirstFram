import 'package:dio/dio.dart';
import 'package:my_firstfram/ab_log/log_driver.dart';

class ApiProvider {
  var logs = CustomPrinter.logging(ApiProvider);

  final Dio _dio = Dio();

  // get 请求
  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      logs.e(e);
      throw Exception('Failed to make GET request: $e');
    }
  }

  // post 请求
  Future<Response> post(String url, dynamic data) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } catch (e) {
      logs.e(e);
      throw Exception('Failed to make GET request: $e');
    }
  }

  // put 请求

  // delete 请求
}
