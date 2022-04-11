import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRequest {
  final String url;
  final Map data;

  ApiRequest({@required this.url, this.data});

  Dio _dio() {
    return Dio(BaseOptions(headers: {
      'Authorization':
          'Bearer YOUR_OANDA_AUTH_KEY',
    }));
  }

  Future<dynamic> get() async {
    try {
      final response = await _dio().get(this.url, queryParameters: this.data);
      return response.data;
    } catch (error, stacktrace) {
      print('Exception occured: $error with stacktrace: $stacktrace');
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }
}
