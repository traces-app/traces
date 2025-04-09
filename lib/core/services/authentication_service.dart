import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:traces/core/constants/api_config.dart';
import 'package:traces/core/utils/auth_provider.dart';

class AuthenticationService {
  final Dio _dio;

  AuthenticationService(this._dio);

  // Method to send credentials to the API for login
  Future<bool> login(String email, String password) async {
    try {
      final response =
          await _dio.post('${ApiConfig.baseUrl}/api/auth/login/', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        String accessToken = response.data['access'];
        String refreshToken = response.data['refresh'];

        await AuthProvider().login(accessToken, refreshToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) print("Error during login: $e");
      return false;
    }
  }

  Future<bool> signup(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      final response =
          await _dio.post('${ApiConfig.baseUrl}/api/auth/register/', data: {
        'email': email,
        'password': password,
        'role': "standard",
        "first_name": firstName,
        "last_name": lastName,
      });

      if (response.statusCode == 200) {
        String accessToken = response.data['access'];
        String refreshToken = response.data['refresh'];

        await AuthProvider().login(accessToken, refreshToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) print("Error during login: $e");
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await AuthProvider().logout();
    } catch (e) {
      if (kDebugMode) print("Error during logout: $e");
    }
  }
}
