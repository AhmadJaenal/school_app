import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:school_app/api/urls.dart';
import 'package:school_app/models/user.dart';

class AuthController {
  final http.Client client;

  AuthController({http.Client? client}) : client = client ?? http.Client();

  Future<User> actionLogin({
    required String username,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('${URLs.baseURL}${URLs.login}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final Map<String, dynamic> data = jsonBody['data'];
      return User.fromJson(data);
    } else {
      dev.log('status code: ${response.statusCode}');
      throw Exception('Failed to login');
    }
  }
}
