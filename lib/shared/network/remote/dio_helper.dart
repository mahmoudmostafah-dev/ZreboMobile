import 'dart:io';

import 'package:dio/dio.dart%20';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';

import '../../error/exceptions.dart';
import '../../server_names.dart';
import '../../storage_names.dart';
import 'app_interceptor.dart';
import 'status_code.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: GetStorage().read<String>(StorageNames.serverURLBox) ??
            ServerNames.liveServer,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        // 60 seconds
        receiveTimeout: const Duration(minutes: 1),
        // 60 seconds
      ),
    )..interceptors.add(AppInterceptor());

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<dynamic> getData({
    @required url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    await DioHelper.init();
    Response? response;

    try {
      response = await dio.get(url, queryParameters: query, options: options);
      return response;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  static Future<dynamic> postData({
    required url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Options? options,

    //String? token,
  }) async {
    await DioHelper.init();

    Response? response;
    try {
      response = await dio.post(url,
          queryParameters: query, data: data, options: options);

      return response;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  static Future<dynamic> deleteData({
    required url,
    Map<String, dynamic>? query,
  }) async {
    await DioHelper.init();

    Response? response;
    try {
      response = await dio.delete(url, queryParameters: query);

      return response;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  static Future<dynamic> postFile({
    required url,
    required data,
    //String? token,
  }) async {
    await DioHelper.init();

    Response? response;
    try {
      response = await dio.post(url, data: data);

      return response;
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }
}

dynamic _handleDioError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      g.Get.showSnackbar(
        const g.GetSnackBar(
          message: "",
          backgroundColor: Colors.red,
          messageText: Center(
            child: Text('Connection  Timeout Exception'),
          ),
          duration: Duration(seconds: 10),
        ),
      );

      throw const FetchDataException();
    case DioErrorType.badResponse:
      switch (error.response?.statusCode) {
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.conflict:
          throw const ConflictException();
        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
        default:
          g.Get.showSnackbar(
            const g.GetSnackBar(
              message: "",
              backgroundColor: Colors.red,
              messageText: Center(
                child: Text('Unexpected error occurred'),
              ),
              duration: Duration(seconds: 10),
            ),
          );
      }
      break;
    case DioErrorType.cancel:
      break;
    case DioErrorType.unknown:
      g.Get.showSnackbar(
        const g.GetSnackBar(
          message: "",
          backgroundColor: Colors.red,
          messageText: Center(
            child: Text('Unknown Error'),
          ),
          duration: Duration(seconds: 10),
        ),
      );
      throw const NoInternetConnectionException();
    default:
      throw const NoInternetConnectionException();
  }
}
