import 'dart:io';

import 'package:code_example/data/repository/api/interceptors/logging_interceptor.dart';
import 'package:code_example/domain/core/utilities/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class APIRepository {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config().get(kReleaseMode ? 'release_api_url' : 'debug_api_url'),
    contentType: ContentType.json.toString(),
    responseType: ResponseType.json,
    connectTimeout: 10000,
    receiveTimeout: 30000,
  );

  late Dio _dio;

  APIRepository() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<Response> get(String endpoint,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(endpoint,
        options: options, queryParameters: queryParameters);
  }

  Future<Response> post(String endpoint,
      {required data, Options? options}) async {
    return await _dio.post(endpoint, data: data, options: options);
  }

  Future<Response> put(String endpoint,
      {required Object data, Options? options}) async {
    return await _dio.put(endpoint, data: data, options: options);
  }

  Future<Response> delete(String endpoint, {Options? options}) async {
    return await _dio.delete(endpoint, options: options);
  }

  get dio => _dio;
}
