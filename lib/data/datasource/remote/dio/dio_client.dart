
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../repositories/local/sharepreferences_class.dart';
import 'logging_interceptor.dart';

class DioClient{
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;
  String? countryCode;


  DioClient(this.baseUrl,Dio? dioC,{required this.loggingInterceptor,required this.sharedPreferences,}){

    dio = dioC ?? Dio();
    dio!
    ..options.baseUrl = baseUrl
    ..options.connectTimeout = const Duration(milliseconds: 20000)
    ..options.receiveTimeout = const Duration(milliseconds: 20000)
    ..httpClientAdapter
    ..options.headers = {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Accept-Language': 'en',
    };
    dio!.interceptors.add(loggingInterceptor);

  }

  Future<void> updateHeader() async{
    try{
      String? token = await SharedPreferencesClass.getValue(SharedPreferencesClass.token);
      String? cookieName = await SharedPreferencesClass.getValue(SharedPreferencesClass.cookieName);
      dio?.options.headers = {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        if(token != null)'Authorization': 'Bearer $token',
        if(cookieName != null) 'cookie': cookieName,
      };
      print("UpdatedHeader.....${dio!.options.headers}");
    }catch(er){
      rethrow;
    }
  }


  Future<Response> get(String uri, {Map<String, dynamic>? queryParameters, Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,}) async {
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> post(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (kDebugMode) {
        print("#DATA...$data");
      }
      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> put(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (kDebugMode) {
        print("#DATA...$data");
      }
      var response = await dio!.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }



  Future<Response> delete(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

}