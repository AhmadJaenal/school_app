  Future<Map<String, dynamic>> getAllProjectById() async {
    Map<String, dynamic> result;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessToken')!;
    int projectId = prefs.getInt('projectId')!;

    Response response =
        await get(Uri.parse("${URLs.getProjectById}/$projectId"), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      var projectData = responseData['data'];

      Project project = Project.fromJson(projectData);
      result = {'status': true, 'message': 'Successful', 'data': project};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }
