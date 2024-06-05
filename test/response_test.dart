import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:developer' as developer;

import 'package:school_app/features/student/data/datasources/remote_datasource.dart';
import 'package:school_app/firebase_options.dart';

num math(int a, b) => a + b;

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
  });

  test('test get data student', () async {
    final StudentRemoteDatasourceImplementation studentRemote =
        StudentRemoteDatasourceImplementation();

    var response = await studentRemote.getStudentData("1");
    expect(response, DocumentSnapshot);
  });

  test('test math', () {
    expect(math(10, 0), equals(10));
  });
}
