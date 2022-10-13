import 'dart:async';

import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(options);
    print('Header Options : ${options.method}');
    print(
        "--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl ?? ""}${options.path ?? ""}"}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));

    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    print("Response Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("${err.response != null ? err.response?.data : 'Unknown Error'}");
  }
}
