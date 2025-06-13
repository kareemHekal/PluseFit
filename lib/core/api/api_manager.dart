import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constant.dart';

@singleton
class ApiManager {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constant.baseUrl,
          connectTimeout: Constant.connectTimeout,
          receiveTimeout: Constant.connectTimeout,
          sendTimeout: Constant.connectTimeout),
    );
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }));
  }

  Future<Response> getRequest(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    var response = await dio.get(endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> postRequest(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    var response = await dio.post(endpoint,
        data: body, options: Options(headers: headers));
    return response;
  }



  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data, // ✅ Add this parameter for the request body
  }) async {
    var response = await dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: data, // ✅ Pass the request body here
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> delete(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    var response = await dio.delete(endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> patchRequest(
      {required String endpoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    var response = await dio.patch(endpoint,
        data: body,
        options: Options(
          headers: headers,
        ));
    return response;
  }

  Future<Response> putFormData({
    required String endpoint,
    required FormData formData, // Change to accept FormData directly
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.put(
        endpoint,
        data: formData,
        options: Options(
          headers: headers,
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
