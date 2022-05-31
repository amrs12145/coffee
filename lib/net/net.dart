import 'dart:developer';

import 'package:coffe/shared/constants.dart';
import 'package:dio/dio.dart';

class Net {
  static final Dio dio = _initialize();

  static Dio _initialize() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.local,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        options.headers['accept'] = 'application/json';
        options.headers['content-type'] = 'application/json; charset=utf-8';

        log(
          'Request: ${options.method} - ${options.baseUrl}${options.path}\n'
          'Headers: ${options.headers.toString()}\n'
          'Request Body: ${options.data.toString()}\n',
        );
        return handler.next(options);
      },
      onResponse: (Response response, handler) async {
        log('Response Body: ${response.toString()}\n');
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        final response = error.response;
        if (response != null) {
          log('${response.statusCode} - ${response.statusMessage}\n\n');
        } else {
          log(error.type.toString());
        }
        return handler.next(error);
      },
    ));

    return dio;
  }
}
