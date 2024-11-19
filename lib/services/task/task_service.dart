import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:school_app/api/urls.dart';
import 'package:school_app/core/platform/status.dart';
import 'package:school_app/models/task.dart';
import 'package:school_app/models/submission.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as dev;

class TaskProvider with ChangeNotifier {
  ProcessState _taskStatus = ProcessState.idle;
  ProcessState get taskStatus => _taskStatus;

  Future<Map<String, dynamic>> getAllTaskByIdProject() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int projectId = prefs.getInt('projectId')!;

    Response response = await get(
      Uri.parse(URLs.taskByProjectId + projectId.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taksData = responseData['data'];

      List<TaskModel> listTask = TaskModel.fromJsonList(taksData);
      result = {'status': true, 'message': 'Successful', 'data': listTask};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getTaskByTaskId() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int taskId = prefs.getInt('taskId')!;

    Response response = await get(
      Uri.parse(URLs.taskById + taskId.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taksData = responseData['data'];

      TaskModel task = TaskModel.fromJson(taksData);
      result = {'status': true, 'message': 'Successful', 'data': task};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getSubmissionByTaskIdAndUserId() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int taskId = prefs.getInt('taskId')!;

    Response response = await get(
      Uri.parse(URLs.getSubmissionByTaskIdAndUserId + taskId.toString()),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taksData = responseData['data'];

      Submission task = Submission.fromJson(taksData);
      prefs.setInt('submissionId', task.id!);
      result = {'status': true, 'message': 'Successful', 'data': task};
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        'status': false,
        'message': responseData,
        'status_code': response.statusCode,
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> getAllTask() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    Response response = await get(
      Uri.parse(URLs.getAllTask),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taksData = responseData['data'];

      List<TaskModel> task = TaskModel.fromJsonList(taksData);
      result = {'status': true, 'message': 'Successful', 'data': task};
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        'status': false,
        'message': responseData,
        'status_code': response.statusCode,
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> newTask(
      {required String title, desc, required int projectId}) async {
    Map<String, dynamic> result;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;

    final Map<String, dynamic> taskData = {
      'title': title,
      'project_id': projectId,
      'desc': desc,
    };

    _taskStatus = ProcessState.uploading;
    notifyListeners();

    Response response = await post(
      Uri.parse(URLs.addNewTask),
      body: json.encode(taskData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var taskData = responseData['data'];

      TaskModel task = TaskModel.fromJson(taskData);
      _taskStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'data': task};
    } else {
      _taskStatus = ProcessState.error;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> deleteTaskById() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int taskId = prefs.getInt('taskId')!;

    Response response = await delete(
      Uri.parse('${URLs.deleteTaskById}$taskId/delete'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );
    dev.log(response.body.toString(), name: 'response code project');

    _taskStatus = ProcessState.uploading;
    notifyListeners();
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      _taskStatus = ProcessState.success;
      notifyListeners();

      result = {'status': true, 'message': 'Successful'};
    } else {
      _taskStatus = ProcessState.failure;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['errors']
      };
    }
    return result;
  }
}
