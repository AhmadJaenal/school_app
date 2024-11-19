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
