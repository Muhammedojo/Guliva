import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/model/login.dart';
import 'endpoints.dart';

class ApiProvider {
  Future<Login> login(String username, String password) async {
    int? statusCode;
    try {
      var body = <String, String>{};
      body["email"] = username;
      body["password"] = password;

      Response response = await doPostRequest(login, body);
      statusCode = response.statusCode;

      //log("Login response : ${response.toString()}");
      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());
        var requestResponse = Login.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      } else {
        var requestResponse = Login();
        requestResponse.statusCode = statusCode!;
        requestResponse.name = response.toString();
        return requestResponse;
      }
    } on DioException catch (e) {
      // log("Response error: ${e.response!.data}");

      var requestResponse = Login();

      requestResponse.name = _handleDioError(e);
      return requestResponse;
    }
  }
}

_handleDioError(DioException error) {
  String errorDescription = "";
  if (error.response?.statusCode == 422) {
    return errorDescription =
        error.response?.data['message'] ?? "Bad response from the server.";
  }
  if (error.error != null && error.error is SocketException) {
    return "Connection to server failed due to internet connection.";
  }

  switch (error.type) {
    case DioExceptionType.cancel:
      errorDescription = "Request to server was cancelled.";
      break;
    case DioExceptionType.connectionTimeout:
      errorDescription = "Connection timeout with server.";
      break;
    case DioExceptionType.connectionError:
      errorDescription =
          "Connection to server failed due to internet connection.";
      break;
    case DioExceptionType.badCertificate:
      errorDescription = "Bad Certificate.";
      break;
    case DioExceptionType.badResponse:
      errorDescription = "Bad response from the server.";
      break;
    case DioExceptionType.receiveTimeout:
      errorDescription = "Receive timeout in connection with server.";
      break;
    case DioExceptionType.sendTimeout:
      errorDescription = "Send timeout in connection with server.";
      break;
    case DioExceptionType.unknown:
      errorDescription =
          "Connection to server failed due to internet connection.";
      break;
  }
  return errorDescription;
}

Future<Response> doPostRequest(endPoint, dynamic body) async {
  endPoint = endPoint.replaceAll("*", "");
  var header = await _getNormalHeader();
  var dio = Dio();
  dio.options.baseUrl = baseApi;
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  dio.options.connectTimeout = const Duration(minutes: 1); //30s
  dio.options.receiveTimeout = const Duration(minutes: 1); // 2 min

  Response response =
      Response(requestOptions: RequestOptions(method: "post", path: endPoint));
  try {
    response = await dio.post(endPoint,
        data: jsonEncode(body), options: Options(headers: header));
  } on DioException catch (e) {
    response.statusMessage =
        (e.response?.statusCode ?? 500).toString().startsWith("5")
            ? "Something went Wrong,Please try again later."
            : e.response?.data['message'];
    response.statusCode = e.response?.statusCode ?? 500;
  }

  return response;
}

/// Get header for normal GET-POST requests.
Future<Map<String, String>> _getNormalHeader() async {
  var header = <String, String>{};
  header["Content-Type"] = "application/json";
  header["Connection"] = "close";
  header["Accept"] = "application/json";

  return header;
}

bool _isConnectionSuccessful(int? statusCode) =>
    statusCode == 200 || statusCode == 201;
