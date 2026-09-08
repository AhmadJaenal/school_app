import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:school_app/network/urls.dart';
import 'package:school_app/core/platform/status.dart';
import 'dart:developer' as dev;

import 'package:school_app/models/user.dart';

class StudentAuthProvider with ChangeNotifier {
  AuthStatus _loggedInStatus = AuthStatus.loggedIn;
  AuthStatus _registerInStatus = AuthStatus.notRegistered;

  AuthStatus get loggedInStatus => _loggedInStatus;
  AuthStatus get registeredInStatus => _registerInStatus;

  Future<Map<String, dynamic>> login({required String email, password}) async {
    Map<String, dynamic> result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    _loggedInStatus = AuthStatus.authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);
      UserPreferences().saveUser(authUser);

      _loggedInStatus = AuthStatus.loggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'data': authUser};
    } else {
      _loggedInStatus = AuthStatus.notLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register({
    required String name,
    email,
    password,
    required int schoolId,
  }) async {
    Map<String, dynamic> result;

    final Map<String, dynamic> loginData = {
      'name': name,
      'school_id': schoolId,
      'email': email,
      'password': password,
    };

    _registerInStatus = AuthStatus.registering;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.register),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );
    dev.log(name: "respone code register", response.statusCode.toString());

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);
      _registerInStatus = AuthStatus.registered;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'data': authUser};
    } else {
      _registerInStatus = AuthStatus.notRegistered;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  logOut(BuildContext context) async {
    UserPreferences().removeUser();
    _loggedInStatus = AuthStatus.loggedOut;
    notifyListeners();
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
