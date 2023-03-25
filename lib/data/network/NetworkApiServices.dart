import 'dart:convert';
import 'dart:io';

import 'package:News_API/data/app_exceptions.dart';
import 'package:News_API/data/network/BaseApiServices.dart';
import 'package:News_API/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      Dio dio = Dio()
        ..interceptors.addAll([
          DioInterceptor(),
          DioCacheManager(CacheConfig(baseUrl: url)).interceptor,
        ]);

      final response = await dio
          .get(url,
              options: buildCacheOptions(const Duration(days: 7),
                  maxStale: const Duration(days: 10)))
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet');
    } on RequestTimeOutException {
      throw RequestTimeOutException('');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        throw UnauthorizedException(response.data.toString());
      default:
        throw FetchDataException(
            "Error occurred while communication with server with status-code ${response.statusCode.toString()}");
    }
  }
}
