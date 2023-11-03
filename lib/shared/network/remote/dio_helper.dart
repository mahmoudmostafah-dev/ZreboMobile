import 'package:dio/dio.dart%20';
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
  }

  static Future<dynamic> getData({
    @required url,
    Map<String, dynamic>? query,
    Options? options,
  }) async {
    Response? response;

    try {
      response = await dio.get(url, queryParameters: query, options: options);
      return response;
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  static Future<dynamic> postData({
    required url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    Options? options,

    //String? token,
  }) async {
    Response? response;
    try {
      response = await dio.post(url,
          queryParameters: query, data: data, options: options);

      return response;
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  static Future<dynamic> deleteData({
    required url,
    Map<String, dynamic>? query,
  }) async {
    Response? response;
    try {
      response = await dio.delete(url, queryParameters: query);

      return response;
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }

  static Future<dynamic> postFile({
    required url,
    required data,
    //String? token,
  }) async {
    Response? response;
    try {
      response = await dio.post(url, data: data);

      return response;
    } on DioException catch (error) {
      _handleDioException(error);
    }
  }
}

dynamic _handleDioException(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
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
    case DioExceptionType.badResponse:
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
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.unknown:
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
