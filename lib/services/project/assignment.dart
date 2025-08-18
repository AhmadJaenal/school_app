import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:school_app/api/urls.dart';
import 'package:school_app/models/project_assignment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer' as dev;

enum AssignmentStatus {
  success,
  failure,
  error,
  uploading,
  delete,
  idle,
}

class AssignmentProvider with ChangeNotifier {
  AssignmentStatus _assignmentStatus = AssignmentStatus.idle;
  AssignmentStatus get assignmentStatus => _assignmentStatus;

  Future<Map<String, dynamic>> getAllAssignment() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getAssignmentProject),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    dev.log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var assignmentData = responseData['data'];

      List<ProjectAssignment> listAssignment =
          ProjectAssignment.fromJsonList(assignmentData);

      result = {
        'status': true,
        'message': 'Successful',
        'data': listAssignment
      };
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> addAssignment(
      {required int projectId, userId}) async {
    Map<String, dynamic> result;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    final Map<String, dynamic> assignmentData = {
      'user_id': userId,
      'project_id': projectId,
    };

    _assignmentStatus = AssignmentStatus.uploading;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.addAssignment),
      body: json.encode(assignmentData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    dev.log(response.statusCode.toString(), name: 'Test');

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taskData = responseData['data'];

      ProjectAssignment task = ProjectAssignment.fromJson(taskData);
      _assignmentStatus = AssignmentStatus.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'data': task};
    } else {
      _assignmentStatus = AssignmentStatus.error;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
}
