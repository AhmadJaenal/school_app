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
