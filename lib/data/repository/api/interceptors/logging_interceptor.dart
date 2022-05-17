import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  Logger logger = getLogger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
        'REQUEST[${options.method}] => PATH: ${options.path} HEADERS: ${options.headers} BODY: ${options.data}  QUERY_PARAMETERS: ${options.queryParameters}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
