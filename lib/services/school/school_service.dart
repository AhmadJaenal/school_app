import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:school_app/network/urls.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/models/school.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class SchoolProvider with ChangeNotifier {
  ProcessState _schoolStatus = ProcessState.idle;
  ProcessState get schoolStatus => _schoolStatus;

  Future<Map<String, dynamic>> getAllSchool() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getAllSchool),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    dev.log(name: 'code get all task', response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var schoolData = responseData['data'];

      List<SchoolModel> listSchool = SchoolModel.fromJsonList(schoolData);
      result = {'status': true, 'message': 'Successful', 'data': listSchool};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> deleteSchoolById() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int schoolId = prefs.getInt('schoolId')!;

    Response response = await delete(
      Uri.parse('${URLs.deleteSchoolById}$schoolId/delete'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    _schoolStatus = ProcessState.uploading;
    notifyListeners();
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      _schoolStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
    } else {
      _schoolStatus = ProcessState.failure;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['errors'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> addNewSchool({
    required String name,
    required int durationIntern,
  }) async {
    Map<String, dynamic> result;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    final Map<String, dynamic> schoolData = {
      'name': name,
      'duration_intern': durationIntern,
    };

    _schoolStatus = ProcessState.uploading;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.newSchool),
      body: json.encode(schoolData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    dev.log('add school', name: response.statusCode.toString());

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var schoolData = responseData['data'];

      SchoolModel school = SchoolModel.fromJson(schoolData);
      _schoolStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'data': school};
    } else {
      _schoolStatus = ProcessState.error;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }
}
