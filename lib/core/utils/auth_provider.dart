import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traces/core/services/jwt_service.dart';

class AuthProvider with ChangeNotifier {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final JwtService _jwtService = JwtService();

  String? _accessToken;
  String? _refreshToken;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  bool get isAuthenticated => _accessToken != null && _refreshToken != null;

  // Initialize the AuthProvider and check if tokens exist
  Future<void> init() async {
    _accessToken = await _storage.read(key: 'access');
    _refreshToken = await _storage.read(key: 'refresh');

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
  }

  // Log in and store tokens
  Future<void> login(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    await _storage.write(key: 'access', value: accessToken);
    await _storage.write(key: 'refresh', value: refreshToken);
    notifyListeners();
  }

  // Log out and clear tokens
  Future<void> logout() async {
    _accessToken = null;
    _refreshToken = null;

    await _storage.delete(key: 'access');
    await _storage.delete(key: 'refresh');
    notifyListeners();
  }

  // Handle token refresh logic
  Future<void> refreshAccessToken() async {
    if (_refreshToken != null) {
      try {
        final response = await _jwtService.post('/auth/token/refresh/', data: {
          'refresh': _refreshToken,
        });

        String newAccessToken = response.data['access'];
        String newRefreshToken = response.data['refresh'];

        // Store the new tokens
        await _storage.write(key: 'access', value: newAccessToken);
        await _storage.write(key: 'refresh', value: newRefreshToken);

        // Update internal state
        _accessToken = newAccessToken;
        _refreshToken = newRefreshToken;

        notifyListeners();
      } catch (e) {
        if (kDebugMode) print("Error refreshing token: $e");
        logout(); // Log out if refresh fails
      }
    }
  }
}
