import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/api/urls.dart';
import 'package:school_app/controllers/classroom_controller.dart';
import 'package:school_app/models/classroom.dart';
import 'dart:convert';

import 'temporary_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ClassroomController.fetchClassrooms', () {
    late MockClient mockClient;
    late ClassroomController controller;

    setUp(() {
      mockClient = MockClient();
      controller = ClassroomController(client: mockClient);
    });

    test('returns list of Classroom on 200 response', () async {
      final mockResponse = {
        "data": [
          {
            "id": 1,
            "name": "Kelas A",
            "code": "CLS001",
            "capacity": 30,
            "description": "Kelas Matematika",
            "teacher_id": 101,
            "start_date": "2025-08-01",
            "end_date": "2025-12-31"
          },
          {
            "id": 2,
            "name": "Kelas B",
            "code": "CLS002",
            "capacity": 25,
            "description": "Kelas Fisika",
            "teacher_id": 102,
            "start_date": "2025-08-01",
            "end_date": "2025-12-31"
          }
        ]
      };

      when(mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classrooms}')))
          .thenAnswer(
              (_) async => http.Response(json.encode(mockResponse), 200));

      final result = await controller.fetchClassrooms();

      expect(result, isA<List<Classroom>>());
      expect(result.length, 2);
      expect(result[0].name, equals("Kelas A"));
      expect(result[0].code, equals("CLS001"));
      expect(result[0].teacherId, equals(101));
    });
  });
}
