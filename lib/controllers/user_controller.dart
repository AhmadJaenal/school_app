import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_app/api/urls.dart';
import 'package:school_app/models/user.dart';
import 'dart:developer' as dev;

class UserController {
  final http.Client client;
  UserController({http.Client? client}) : client = client ?? http.Client();

  Future fetchCurrentUser({http.Client? client}) async {
    final usedClient = client ?? http.Client();
    final response =
        await usedClient.get(Uri.parse('${URLs.baseURL}${URLs.currentUser}'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final data = jsonBody['data'];
      return User.fromJson(data);
    } else {
      dev.log('status code user data: ${response.statusCode}');
      throw Exception('Failed to load user data');
    }
  }
}
