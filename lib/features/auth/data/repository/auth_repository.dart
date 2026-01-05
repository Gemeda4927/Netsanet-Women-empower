import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository({Dio? dio}) : _dio = dio ?? Dio();

  /// Login user with phone & password
  Future<String> login(String phone, String password) async {
    try {
      // Replace with your API endpoint
      final response = await _dio.post(
        'https://api.example.com/auth/login',
        data: {'phone': phone, 'password': password},
      );

      if (response.statusCode == 200) {
        // Assuming API returns {"message": "..."} on success
        return response.data['message'] ?? 'Login successful';
      } else {
        throw Exception(response.data['error'] ?? 'Login failed');
      }
    } catch (e) {
      // Handle DioError or other exceptions
      throw Exception('Login error: $e');
    }
  }

  /// Register user
  Future<String> register({
    required String fullName,
    required String phone,
    required String serviceType,
    required String city,
  }) async {
    try {
      final response = await _dio.post(
        'https://api.example.com/auth/register',
        data: {
          'full_name': fullName,
          'phone': phone,
          'service_type': serviceType,
          'city': city,
        },
      );

      if (response.statusCode == 200) {
        return response.data['message'] ?? 'Registration successful';
      } else {
        throw Exception(response.data['error'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception('Registration error: $e');
    }
  }
}
