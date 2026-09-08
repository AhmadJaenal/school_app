import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_app/network/urls.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class StudentProvider with ChangeNotifier {
  Future<Map<String, dynamic>> getAllStudent() async {
    Map<String, dynamic> result;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getAllStudent),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    dev.log(name: 'test', response.statusCode.toString());

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      List<User> listUser = User.fromJsonList(userData);
      result = {'status': true, 'message': 'Successful', 'data': listUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }
}
