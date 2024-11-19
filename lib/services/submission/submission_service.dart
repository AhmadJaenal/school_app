import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:school_app/api/urls.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/models/Submission.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class SubmissionProvider with ChangeNotifier {
  ProcessState _submissionStatus = ProcessState.idle;
  ProcessState get submissionStatus => _submissionStatus;

  Future<Map<String, dynamic>> addNewSubmission({required String desc}) async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int taskId = prefs.getInt('taskId')!;

    final Map<String, dynamic> submissionData = {
      'task_id': taskId,
      'desc': desc,
      'url_image': 'Mobile Dev'
    };

    _submissionStatus = ProcessState.uploading;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.addSubmission),
      body: json.encode(submissionData),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    dev.log(name: 'status code submission', response.statusCode.toString());

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var submissionData = responseData['data'];

      _submissionStatus = ProcessState.success;
      notifyListeners();

      Submission submission = Submission.fromJson(submissionData);
      result = {'status': true, 'message': 'Successful', 'data': submission};
    } else {
      _submissionStatus = ProcessState.failure;
      notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getSubmissionsByUserIdAndDate() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int userId = prefs.getInt('userId')!;
    String date = prefs.getString('dateTask')!;
    DateTime dateTime = DateTime.parse(date);
    String onlyDate = DateFormat('yyyy-MM-dd').format(dateTime);

    Response response = await get(
      Uri.parse('${URLs.getSubmissionsByUserIdAndDate}/$userId/$onlyDate'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    dev.log(response.body.toString(), name: 'test');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var submissionData = responseData['data'];

      List<Submission> listSubmission = Submission.fromJsonList(submissionData);
      result = {
        'status': true,
        'message': 'Successful',
        'data': listSubmission
      };
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getAllUserSubmittedTask() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getAllUserBySubmissionToday),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    dev.log(response.body.toString(), name: 'test');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var usersData = responseData['data'];

      List<User> listUser = User.fromJsonList(usersData);
      result = {'status': true, 'message': 'Successful', 'data': listUser};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> deleteSubmission() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int submissionId = prefs.getInt('submissionId')!;

    _submissionStatus = ProcessState.delete;
    notifyListeners();

    Response response = await delete(
      Uri.parse('${URLs.deleteSubmission}/$submissionId/delete'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    dev.log(name: 'response delete submission', response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _submissionStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
    } else {
      _submissionStatus = ProcessState.failure;
      notifyListeners();

      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }
}
