import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:tajir/localization/localization_service.dart';
import 'api_auth_interceptor.dart';
import 'api_base.dart';
import 'api_exception.dart';
import 'dart:convert';

class HttpClient {
  static const requestTimeoutMilliseconds = 20000;
  static final HttpClient _singleton = HttpClient();
  late Dio _dio;
  late LocalizationService _localizationService;

  HttpClient() {
    _localizationService = LocalizationService();
    var cookieJar = CookieJar();
    _dio = Dio(BaseOptions(
      responseType: ResponseType.plain,
      connectTimeout: requestTimeoutMilliseconds,
    ));
    _dio.interceptors.add(CookieManager(cookieJar));
    _dio.interceptors.add(ApiAuthInterceptor(
        mainDio: _dio, localizationService: _localizationService));
  }

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;

    print('Method is GET and current uri is: $uri');
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

    print('Method is POST and current uri is: $uri');
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

  Future<dynamic> putData(String url,
      {dynamic body, Map<String, String>? params}) async {
    dynamic responseJson;
    String uri = APIBase.baseURL + url;
    print('Method is PUT and current uri is: $uri');
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
    print('Method is DELETE and current uri is: $uri');
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
