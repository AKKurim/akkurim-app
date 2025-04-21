import 'package:dio/dio.dart';
import '../../utils/utils.dart';
import 'package:supertokens_flutter/dio.dart';
import 'package:supertokens_flutter/supertokens.dart';

class ApiService {
  // Private constructor
  ApiService._internal();
  // Singleton instance
  static final ApiService _instance = ApiService._internal();
  // Getter for the instance
  static ApiService get instance => _instance;
  late Dio _dio;
  // Configuration function
  void configureDio({
    required String baseUrl,
    Map<String, dynamic>? defaultHeaders,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    void Function(RequestOptions options, RequestInterceptorHandler handler)?
        onRequest,
    void Function(Response response, ResponseInterceptorHandler handler)?
        onResponse,
    void Function(DioException e, ErrorInterceptorHandler handler)? onError,
  }) {
    SuperTokens.init(apiDomain: baseUrl, apiBasePath: '/auth');
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? const Duration(seconds: 30),
      receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
      validateStatus: (status) => status! < 500,
      headers: defaultHeaders ??
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
    ));
    _dio.interceptors.add(SuperTokensInterceptorWrapper(client: _dio));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest ??
            (options, handler) {
              Utils.debugPrint('Request: ${options.method} ${options.path}');
              Utils.debugPrint('Headers: ${options.headers}');
              Utils.debugPrint('Query Params: ${options.queryParameters}');
              handler.next(options);
            },
        onResponse: onResponse ??
            (response, handler) {
              Utils.debugPrint(
                  'Response: ${response.statusCode} ${response.data}');
              handler.next(response);
            },
        onError: onError ??
            (DioException e, handler) {
              Utils.debugPrint('Error: ${e.message}');
              handler.next(e);
            },
      ),
    );
  }

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    Utils.debugPrint('POST request to $endpoint with data: $data');
    try {
      Response response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteRequest(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
