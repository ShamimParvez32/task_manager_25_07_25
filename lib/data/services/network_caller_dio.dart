import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage,
  });
}

class NetworkCaller {
  static final Dio _dio = Dio();

  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      debugPrint('URL => $url');
      final response = await _dio.get(url);
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.data}');

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode!,
          responseData: Map<String, dynamic>.from(response.data),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      debugPrint('URL => $url');
      final response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.data}');

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode!,
          responseData: Map<String, dynamic>.from(response.data),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode!,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}
