import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:network_caller/src/data/model/network_response.dart';

class NetworkCaller {
  final Logger logger;
  String _accessToken = '';

  NetworkCaller({
    required this.logger,
  });
  set accessToken(String token) => _accessToken = token;

  Future<NetworkResponse> getRequest({
    required String url,
    String? token,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url, {}, {}, _accessToken.toString());
      logger.i(url);
      final Response response = await get(uri, headers: {
        'token': '${token ?? _accessToken}',
      });

      if (response.statusCode == 200) {
        responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url,
      required String? token,
      Map<String, dynamic>? body}) async {
    try {
      requestLog(url, {}, body ?? {}, _accessToken.toString());
      Uri uri = Uri.parse(url);
      final Response response = await post(
        uri,
        headers: {
          'token': token ?? '${_accessToken}',
          'content-type': 'application/json',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        responseLog(
            url, response.statusCode, response.body, response.headers, true);
        final decodedBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedBody);
      } else {
        if (response.statusCode == 400) {}
        responseLog(
            url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String tokens) {
    logger.i('''
    Url : $url,
    Params : $params,
    Body : $body,
    Token:$tokens
    
    ''');
  }

  void responseLog(String url, int statusCode, dynamic responseBody,
      Map<String, dynamic> headers, bool isSuccess,
      [dynamic error]) {
    String message = '''
    Url : $url,
    Status Code : $statusCode,
    Response Body :$responseBody,
    Headers : $headers,
    Error : $error,
    ''';
    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
