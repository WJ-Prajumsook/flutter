import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRepository {
  final String url;
  final Map payload;

  ApiRepository({@required this.url, this.payload});

  Dio _dio = Dio();

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) {
    _dio.get(this.url, queryParameters: this.payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
