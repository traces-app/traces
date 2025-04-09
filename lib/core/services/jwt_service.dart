import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traces/core/constants/api_config.dart';

class JwtService {
  static final JwtService _singleton = JwtService._internal();
  factory JwtService() => _singleton;

  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  JwtService._internal() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Get the access token from secure storage
        String? accessToken = await _storage.read(key: 'access');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token expiration (refresh token)
          String? refreshToken = await _storage.read(key: 'refresh');
          if (refreshToken != null) {
            try {
              // Assume an endpoint to refresh the token
              Response response = await _dio
                  .post('${ApiConfig.baseUrl}/api/auth/token/refresh/', data: {
                'refresh': refreshToken,
              });

              // Get new tokens from the response
              String newAccessToken = response.data['access'];
              String newRefreshToken = response.data['refresh'];

              // Store the new tokens securely
              await _storage.write(key: 'access', value: newAccessToken);
              await _storage.write(key: 'refresh', value: newRefreshToken);

              // Retry the failed request with the new access token
              RequestOptions options = e.requestOptions;
              options.headers['Authorization'] = 'Bearer $newAccessToken';

              // Retry the request with the new token
              final cloneReq = await _dio.request(
                options.path,
                data: options.data, // Passing data explicitly
                queryParameters: options
                    .queryParameters, // Passing query parameters explicitly
                options: Options(
                  method: options.method, // HTTP method
                  headers: options.headers, // Headers (with updated token)
                  responseType:
                      options.responseType, // Response type (e.g., JSON)
                ),
              );

              return handler.resolve(cloneReq);
            } catch (refreshError) {
              if (kDebugMode) print('Error refreshing token: $refreshError');
            }
          }
        }
        return handler.next(e);
      },
    ));
  }

  Future<void> storeTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access', value: accessToken);
    await _storage.write(key: 'refresh', value: refreshToken);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: 'access');
    await _storage.delete(key: 'refresh');
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(url, queryParameters: queryParameters);
    } on DioException catch (e) {
      return Future.error(e);
    }
  }

  Future<Response> post(String url, {dynamic data}) async {
    try {
      return await _dio.post(url, data: data);
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}
