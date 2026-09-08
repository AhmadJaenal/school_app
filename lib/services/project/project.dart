import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_app/core/platform/status.dart';

import '../../network/urls.dart';
import '../../models/project.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer' as dev;

class ProjectProvider with ChangeNotifier {
  ProcessState _projectStatus = ProcessState.idle;
  ProcessState get projectStatus => _projectStatus;

  Future<Map<String, dynamic>> getAllProject() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.allProject),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      List<Project> listProject = Project.fromJsonList(projectData);
      result = {'status': true, 'message': 'Successful', 'data': listProject};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getAllProjectById() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int projectId = prefs.getInt('projectId')!;

    Response response = await get(
      Uri.parse("${URLs.getProjectById}/$projectId"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      Project project = Project.fromJson(projectData);
      result = {'status': true, 'message': 'Successful', 'data': project};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getProjectByAssigment() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getProjectByAssignment),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    dev.log(response.statusCode.toString(), name: 'response code project');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data']['projects'];

      List<Project> project = Project.fromJsonList(projectData);
      result = {'status': true, 'message': 'Successful', 'data': project};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> deleteProjectById() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int projectId = prefs.getInt('projectId')!;

    Response response = await delete(
      Uri.parse('${URLs.deleteProjectById}$projectId/delete'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    dev.log(response.body.toString(), name: 'response code project');

    _projectStatus = ProcessState.uploading;
    notifyListeners();
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      _projectStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
    } else {
      _projectStatus = ProcessState.failure;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['errors'],
      };
    }
    return result;
  }
}
