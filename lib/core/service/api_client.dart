import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:infytel_test/core/exception/exception.dart';

class ApiResponse {
  final dynamic data;
  final int statusCode;
  final String? error;

  ApiResponse({this.data, this.statusCode = 0, this.error});

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<ApiResponse> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse> patch(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<ApiResponse> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic error) {
    if (error is TimeoutException) {
      throw const BaseException('Request timed out.');
    } else if (error is http.ClientException) {
      throw BaseException('No internet connection');
    } else if (error is SocketException) {
      throw BaseException('${error.toString()} ');
    } else if (error is FormatException) {
      throw const BaseException('Invalid URL. Please provide a valid URL.');
    } else {
      throw BaseException('An error occurred: $error');
    }
  }

  ApiResponse _handleResponse(http.Response response) {
    try {
      final dynamic data = json.decode(response.body);
      return ApiResponse(data: data, statusCode: response.statusCode);
    } catch (e) {
      throw BaseException('Failed to parse data', code: response.statusCode);
    }
  }
}
