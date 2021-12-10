import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:tajir/data/network/api_key_secret.dart';
import 'package:tajir/data/network/api_path.dart';
import 'package:tajir/data/shared_preferences/storage_token.dart';
import 'package:tajir/data/shared_preferences/storage_login.dart';
import 'package:tajir/localization/localization_service.dart';
import 'package:tajir/model/login.dart';
import 'package:tajir/util/auth_header_util.dart';

import 'api_base.dart';

class ApiAuthInterceptor extends QueuedInterceptor {
  static const requestTimeoutMilliseconds = 20000;
  final Dio mainDio;
  final LocalizationService localizationService;

  ApiAuthInterceptor(
      {required this.mainDio, required this.localizationService});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    options.headers['X-Oc-Merchant-Language'] =
        localizationService.getLangCode().toLowerCase();
    if (!options.headers.containsKey(AuthHeaderUtil.authorizationHeader)) {
      String? token = await StorageToken.getAccessToken();
      if (token != null) {
        options.headers[AuthHeaderUtil.authorizationHeader] = "Bearer $token";
        return handler.next(options);
      } else {
        Dio dio = Dio(BaseOptions(
          responseType: ResponseType.plain,
          connectTimeout: requestTimeoutMilliseconds,
        ));
        dio.options.headers[AuthHeaderUtil.authorizationHeader] =
            AuthHeaderUtil.instance.getBasicAuth(
                ApiClientSecret.clientKey, ApiClientSecret.clientSecret);
        String tokenUrl =
            APIBase.baseURL + APIPathHelper.getValue(APIPath.fetchToken);
        Response response = await dio.post(
          tokenUrl,
        );
        if (response.statusCode == 200) {
          String newToken =
              json.decode(response.data.toString())['access_token'];
          StorageToken.saveNewAccessToken(newToken);
          options.headers[AuthHeaderUtil.authorizationHeader] =
              "Bearer $newToken";
          return handler.next(options);
        }
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    int? statusCode = err.response?.statusCode;
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          Map<String, dynamic> errResponse =
              json.decode(err.response!.data.toString());
          List<String> errors = List<String>.from(errResponse['error']);
          Login? login = await StorageLogin.getLogin();
          if (login != null && errors.contains('User is not logged in')) {
            final phonePasswordEncoded = jsonEncode(<String, String>{
              "email": login.phoneNumber!,
              "password": login.password!
            });
            Dio dio = Dio(BaseOptions(
              responseType: ResponseType.plain,
              connectTimeout: requestTimeoutMilliseconds,
            ));
            dio.interceptors.add(mainDio.interceptors
                .firstWhere((element) => element is CookieManager));
            String? token = await StorageToken.getAccessToken();
            if (token != null) {
              dio.options.headers[AuthHeaderUtil.authorizationHeader] =
                  "Bearer $token";
            }
            await dio.post(
                APIBase.baseURL + APIPathHelper.getValue(APIPath.fetchLogin),
                data: phonePasswordEncoded);

            Options opts = Options(
                method: err.requestOptions.method,
                headers: err.requestOptions.headers);

            Response cloneRequest = await dio.request(err.requestOptions.path,
                options: opts,
                data: err.requestOptions.data,
                queryParameters: err.requestOptions.queryParameters);

            return handler.resolve(cloneRequest);
          }
          break;
        case 401:
          Dio dio = Dio(BaseOptions(
            responseType: ResponseType.plain,
            connectTimeout: requestTimeoutMilliseconds,
          ));
          dio.options.headers[AuthHeaderUtil.authorizationHeader] =
              AuthHeaderUtil.instance.getBasicAuth(
                  ApiClientSecret.clientKey, ApiClientSecret.clientSecret);
          String tokenUrl =
              APIBase.baseURL + APIPathHelper.getValue(APIPath.fetchToken);
          Response response = await dio.post(
            tokenUrl,
          );
          if (response.statusCode == 200) {
            String newToken =
                json.decode(response.data.toString())['access_token'];
            await StorageToken.saveNewAccessToken(newToken);

            RequestOptions mainRequestOptions = err.requestOptions;
            mainRequestOptions.headers[AuthHeaderUtil.authorizationHeader] =
                "Bearer $newToken";

            Options opts = Options(
                method: err.requestOptions.method,
                headers: mainRequestOptions.headers);

            Response cloneRequest = await dio.request(err.requestOptions.path,
                options: opts,
                data: err.requestOptions.data,
                queryParameters: err.requestOptions.queryParameters);

            return handler.resolve(cloneRequest);
          }
          break;
        case 403:
          Login? login = await StorageLogin.getLogin();
          if (login != null) {
            Map<String, dynamic> errResponse =
                json.decode(err.response!.data.toString());
            List<String> errors = List<String>.from(errResponse['error']);
            if (errors.contains('User is not logged in')) {
              final phonePasswordEncoded = jsonEncode(<String, String>{
                "email": login.phoneNumber!,
                "password": login.password!
              });
              Dio dio = Dio(BaseOptions(
                responseType: ResponseType.plain,
                connectTimeout: requestTimeoutMilliseconds,
              ));
              dio.interceptors.add(mainDio.interceptors
                  .firstWhere((element) => element is CookieManager));
              String? token = await StorageToken.getAccessToken();
              if (token != null) {
                dio.options.headers[AuthHeaderUtil.authorizationHeader] =
                    "Bearer $token";
              }
              await dio.post(
                  APIBase.baseURL + APIPathHelper.getValue(APIPath.fetchLogin),
                  data: phonePasswordEncoded);

              Options opts = Options(
                  method: err.requestOptions.method,
                  headers: err.requestOptions.headers);

              Response cloneRequest = await dio.request(err.requestOptions.path,
                  options: opts,
                  data: err.requestOptions.data,
                  queryParameters: err.requestOptions.queryParameters);

              return handler.resolve(cloneRequest);
            } else if (errors.contains(
                // ignore: unnecessary_string_escapes
                'The entered phone number and \/ or password is incorrect')) {
              await StorageLogin.clearLogin();
            }
          }
      }
    }
    return super.onError(err, handler);
  }
}
