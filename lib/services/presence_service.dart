import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/datasource/local_datasource.dart';
import 'package:school_app/models/presence.dart';
import 'package:school_app/shared/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/urls.dart';

import 'dart:developer' as dev;

Color getPresenceColor(String status) {
  switch (status) {
    case 'Hadir':
      return AppColors.green;
    case 'Sakit':
      return AppColors.warning2;
    case 'Izin':
      return AppColors.info1;
    default:
      return AppColors.danger2;
  }
}

class PresenceProvider with ChangeNotifier {
  bool hasAbsentToday = false;

  Future<bool> checkPresenceToday() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int userId = prefs.getInt('userId')!;

    Response response = await get(
      Uri.parse(URLs.checkPresence),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    final Map<String, dynamic> responseData = json.decode(response.body);
    return responseData['status'];
  }

  ProcessState _presenceStatus = ProcessState.idle;
  ProcessState get presenceStatus => _presenceStatus;

  Future<Map<String, dynamic>> addPresencePermission(
      {required String status, required String type}) async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId')!;
    String accessToken = prefs.getString('accessToken')!;

    final Map<String, dynamic> presenceData = {
      'status': status,
      'day': 1,
      'type': '-',
    };

    _presenceStatus = ProcessState.uploading;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.addPresence),
      body: json.encode(presenceData),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var presenceData = responseData['data'];

      _presenceStatus = ProcessState.success;
      notifyListeners();

      Presence presence = Presence.fromJson(presenceData);
      result = {'status': true, 'message': 'Successful', 'data': presence};
    } else {
      _presenceStatus = ProcessState.failure;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
      dev.log(json.decode(response.body).toString(),
          name: 'response code absen');
    }
    return result;
  }

  Future<Map<String, dynamic>> getPresenceByUserId() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int id = prefs.getInt('userId')!;
    int? internshipId = prefs.getInt('internshipId');

    Response response = await get(
      Uri.parse('${URLs.presenceByUserId}/ ${internshipId ?? id}/user'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    UserPreferences().removeCountPresence();

    dev.log(internshipId.toString(), name: 'internship id');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var presenceData = responseData['data'];

      List<Presence> listPresence = Presence.fromJsonList(presenceData);
      UserPreferences().savePresence(listPresence);

      result = {'status': true, 'message': 'Successful', 'data': listPresence};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }
}
