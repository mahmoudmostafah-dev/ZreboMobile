import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../app_utils/app_strings.dart';
import '../../storage_names.dart';
import '../end_points.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Check if this is a login request based on the URL or any other criteria.

    final isLoginOrRegistrationRequest =
        options.uri.path == '/api/${EndPoint.apiLogin}' ||
            options.uri.path == '/api/${EndPoint.apiSignUp}';

    // Only add the Authorization header if it's not a login request.
    if (!isLoginOrRegistrationRequest) {
      options.headers[HttpHeaders.authorizationHeader] = AppStrings.bearer +
          (GetStorage().read<String>(StorageNames.tokenBox) ?? '');
    }

    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    options.headers[AppStrings.lang] =
        GetStorage().read<String>(StorageNames.langBox);

    options.followRedirects = false;
    options.validateStatus = (status) {
      return status! <= 500;
    };

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      // UserModel? authenticatedUser =
      //     await authLocalDataSource.getSavedLoginCredentials();
      // if (authenticatedUser != null) {
      // if (await _refreshToken(
      //   authenticatedUser,
      // )) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
      // }
    }
    super.onError(err, handler);
  }
//
// Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
//   final options = Options(
//     method: requestOptions.method,
//     headers: requestOptions.headers,
//   );
//   return client.request<dynamic>(requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options);
// }

// Future<bool> _refreshToken(UserModel authenticatedUser) async {
// final response = await client.post(EndPoints.refreshToken, data: {
//   AppStrings.token: authenticatedUser.token,
//   AppStrings.refreshToken: authenticatedUser.refreshToken,
// });
// final jsonResponse = Commons.decodeJson(response);
// BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);
// if (baseResponse.isSuccess!) {
//   authenticatedUser.token = baseResponse.data["token"];
//   authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
//   authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
//   return true;
// } else {
//   return false;
// }
// }
}
