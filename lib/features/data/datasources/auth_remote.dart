import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smart_season_system/core/utils/baseUrl.dart';

class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password) async {
    final uri = Uri.parse('$baseUrl/login/');
    

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );


    return jsonDecode(response.body);
  }
}