import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:foods_rouni/app/core/extensions/strings_extensions.dart';
import 'package:get/get.dart';

import '../utils/app_log_utils.dart';
import '../values/app_strings.dart';
import '../values/constants/app_constants.dart';
import '../values/constants/app_urls.dart';

class ApiProvider {
  static final _dio = dio.Dio(
    dio.BaseOptions(
      followRedirects: false,
      validateStatus: (int? status) {
        return true;
      },
      baseUrl: AppUrls.baseUrl,
      sendTimeout: const Duration(
        seconds: 60,
      ),
      receiveTimeout: const Duration(
        seconds: 60,
      ),
      connectTimeout: const Duration(
        seconds: 60,
      ),
    ),
  );

  static Future<void> post({
    required String token,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> postFormData({
    required String url,
    required String token,
    required FormData data,
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> delete({
    required String token,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> put({
    required String token,
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> get({
    required String url,
    required String token,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> downloadFile({
    required String token,
    required String url,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    required String pathToSave,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.stream;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.download(
        url,
        data: data,
        queryParameters: queryParameters,
        pathToSave,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> downloadFileAsBytes({
    required String token,
    required String url,
    Map<String, dynamic> data = const {},
    Map<String, dynamic> queryParameters = const {},
    required String pathToSave,
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.bytes;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      dio.Response<List<int>> response = await _dio.get<List<int>>(
        url,
        data: data,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        final savedFile = await File(
          pathToSave,
        ).create(
          recursive: true,
        );

        await savedFile.writeAsBytes(
          response.data!,
          mode: FileMode.write,
          flush: true,
        );

        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

  static Future<void> uploadFile({
    required String token,
    required String url,
    required FormData data,
    Map<String, dynamic> queryParameters = const {},
    required Function(dynamic data) onSuccess,
    required Function(String errorMessage) onError,
    Function(int sent, int total)? onSendProgress,
    Function(int sent, int total)? onReceiveProgress,
  }) async {
    _dio.options.headers['Authorization'] = token.isEmpty ? '' : token.toBearer;

    _dio.options.responseType = dio.ResponseType.json;

    try {
      AppLogUtils.logInfo(
        message: url,
      );

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      AppLogUtils.logInfo(
        message: 'response.statusCode: ${response.statusCode}',
      );

      AppLogUtils.logInfo(
        message: 'response: $response',
      );

      if (response.statusCode == StatusCodeEnum.success.code) {
        onSuccess(
          response.data,
        );
      } else {
        _processNot200StatusCode(
          response: response,
          onError: onError,
        );
      }
    } on Exception catch (error) {
      _exceptionHandling(
        error,
        onError,
      );
    }
  }

//region Private Functions

  static void _processNot200StatusCode({
    required dio.Response response,
    required Function(String errorMessage) onError,
  }) {
    if (response.statusCode != null) {
      onError(
        'Status code: ${response.statusCode} - ${StatusCodeEnum.from(
          code: response.statusCode!,
        ).message.tr}',
      );
    }
  }

  static void _exceptionHandling(
    Exception exception,
    Function(String errorMessage) onError,
  ) {
    // Send substring of exception message
    final exceptionMessage = exception.toString();
    final exceptionMessageLength = exceptionMessage.length;
    const maxLength = AppConstants.maxExceptionMessageLength;

    onError(
      exceptionMessage.substring(
        0,
        exceptionMessageLength > maxLength ? maxLength : exceptionMessageLength,
      ),
    );

    AppLogUtils.logInfo(
      message: exceptionMessage,
    );
  }

//endregion Private Functions
}

enum StatusCodeEnum {
  success(code: 200, message: AppStrings.success),
  badRequest(code: 400, message: AppStrings.badRequest),
  unAuthorized(code: 401, message: AppStrings.unAuthorized),
  forbidden(code: 403, message: AppStrings.forbidden),
  notFound(code: 404, message: AppStrings.notFound),
  conflict(code: 409, message: AppStrings.conflict),
  internalServerError(code: 500, message: AppStrings.internalServerError);

  final int code;
  final String message; // Message needs to be translated

  const StatusCodeEnum({
    required this.code,
    required this.message,
  });

  factory StatusCodeEnum.from({
    required int code,
  }) =>
      StatusCodeEnum.values.firstWhere(
        (element) => element.code == code,
      );
}
