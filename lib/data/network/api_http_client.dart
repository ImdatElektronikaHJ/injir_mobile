import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tajir/localization/localization_service.dart';

import 'api_auth_interceptor.dart';
import 'api_base.dart';
import 'api_exception.dart';

class HttpClient {
  static const requestTimeoutMilliseconds = 20000;
  static final HttpClient _singleton = HttpClient();
  late Dio _dio;
  late LocalizationService _localizationService;

  HttpClient() {
    _localizationService = LocalizationService();

    _dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: requestTimeoutMilliseconds,
    ));
    _getCookie();
    _dio.interceptors.add(ApiAuthInterceptor(
        mainDio: _dio, localizationService: _localizationService));
  }

  _getCookie() async {
    var cookieJar = PersistCookieJar(
      ignoreExpires: true,
    );
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    cookieJar =
        PersistCookieJar(storage: FileStorage(appDocPath + "/.cookies/"));
    _dio.interceptors.add(CookieManager(cookieJar));
  }

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;

    if (kDebugMode) {
      print(
          'Method is GET and current uri is: ${uri + ((params != null) ? queryParameters(params) : "")}');
    }
    try {
      final response = await _dio
          .get(uri, queryParameters: params)
          .timeout(const Duration(milliseconds: requestTimeoutMilliseconds));

      responseJson = json.decode(response.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        _returnResponse(e.response);
      } else {
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future<dynamic> postData(String url,
      {dynamic body, Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;

    if (kDebugMode) {
      print(
          'Method is POST and current uri is: ${uri + ((params != null) ? queryParameters(params) : "")}');
    }
    try {
      Response response =
          await _dio.post(uri, data: body, queryParameters: params);

      responseJson = json.decode(response.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        _returnResponse(e.response);
      } else {
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  String queryParameters(Map<String, String>? params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '&${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> putData(String url,
      {dynamic body, Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;
    if (kDebugMode) {
      print(
          'Method is PUT and current uri is: ${uri + ((params != null) ? queryParameters(params) : "")}');
    }
    try {
      Response response =
          await _dio.put(uri, data: body, queryParameters: params);
      responseJson = json.decode(response.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        _returnResponse(e.response);
      } else {
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {dynamic body, Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;
    if (kDebugMode) {
      print(
          'Method is DELETE and current uri is: ${uri + ((params != null) ? queryParameters(params) : "")}');
    }
    try {
      Response response =
          await _dio.delete(uri, data: body, queryParameters: params);
      responseJson = json.decode(response.data.toString());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        _returnResponse(e.response);
      } else {
        throw FetchDataException('No Internet connection');
      }
    }
    return responseJson;
  }

  dynamic _returnResponse(Response? response) {
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          var responseJson = json.decode(response.data.toString());
          return responseJson;
        case 400:
          throw BadRequestException(response.data.toString());
        case 401:
        case 403:
          throw UnauthorisedException(response.data.toString());
        case 500:
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    }
  }
}
