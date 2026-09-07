import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/api/urls.dart';
import 'package:school_app/controllers/auth_controller.dart';
import 'package:school_app/controllers/classroom_controller.dart';
import 'package:school_app/models/classroom.dart';
import 'package:school_app/models/user.dart';
import 'dart:convert';

import 'temporary_test.mocks.dart';

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
            "end_date": "2025-12-31",
          },
          {
            "id": 2,
            "name": "Kelas B",
            "code": "CLS002",
            "capacity": 25,
            "description": "Kelas Fisika",
            "teacher_id": 102,
            "start_date": "2025-08-01",
            "end_date": "2025-12-31",
          },
        ],
      };

      when(
        mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classrooms}')),
      ).thenAnswer((_) async => http.Response(json.encode(mockResponse), 200));

      final result = await controller.fetchClassrooms();

      expect(result, isA<List<Classroom>>());
      expect(result.length, 2);
      expect(result[0].name, equals("Kelas A"));
      expect(result[0].code, equals("CLS001"));
      expect(result[0].teacherId, equals(101));
    });

    test('throws Exception on non-200 response', () async {
      when(
        mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classrooms}')),
      ).thenAnswer((_) async => http.Response('Server error', 500));

      expect(() => controller.fetchClassrooms(), throwsException);
    });
  });

  group('AuthController.actionLogin', () {
    late MockClient mockClient;
    late AuthController controller;

    setUp(() {
      mockClient = MockClient();
      controller = AuthController(client: mockClient);
    });

    test('returns User on successful login (status 200)', () async {
      final mockResponse = {
        "data": {
          "id": 1,
          "name": "Ahmad",
          "email": "ahmad@example.com",
          "token": "abc123",
        },
      };

      when(
        mockClient.post(
          Uri.parse('${URLs.baseURL}${URLs.login}'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response(json.encode(mockResponse), 200));

      final user = await controller.actionLogin(
        username: 'ahmad',
        password: 'password123',
      );

      expect(user, isA<User>());
      expect(user.fullName, equals('Ahmad'));
      expect(user.email, equals('ahmad@example.com'));
      expect(user.token, equals('abc123'));
    });

    test('throws Exception on failed login (status != 200)', () async {
      when(
        mockClient.post(
          Uri.parse('${URLs.baseURL}${URLs.login}'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        ),
      ).thenAnswer((_) async => http.Response('Unauthorized', 401));

      expect(
        () async => await controller.actionLogin(
          username: 'wrong',
          password: 'wrongpass',
        ),
        throwsException,
      );
    });
  });

  group('ClassroomController.fetchClassroomById', () {
    late MockClient mockClient;
    late ClassroomController controller;

    setUp(() {
      mockClient = MockClient();
      controller = ClassroomController(client: mockClient);
    });

    test('returns Classroom when status code is 200', () async {
      final mockResponse = {
        "data": {
          "id": 1,
          "name": "Kelas A",
          "code": "CLS001",
          "capacity": 30,
          "description": "Kelas Matematika",
          "teacher_id": 101,
          "start_date": "2025-08-01",
          "end_date": "2025-12-31",
        },
      };

      when(
        mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classroomById}1')),
      ).thenAnswer((_) async => http.Response(json.encode(mockResponse), 200));

      final result = await controller.fetchClassroomById(1);

      expect(result, isA<Classroom>());
      expect(result.id, equals(1));
      expect(result.name, equals('Kelas A'));
    });

    test('throws Exception when status code is 404 (Not Found)', () async {
      when(
        mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classroomById}99')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(
        () async => await controller.fetchClassroomById(99),
        throwsException,
      );
    });

    test(
      'throws Exception when status code is 500 (Internal Server Error)',
      () async {
        when(
          mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classroomById}2')),
        ).thenAnswer((_) async => http.Response('Internal Server Error', 500));

        expect(
          () async => await controller.fetchClassroomById(2),
          throwsException,
        );
      },
    );

    test('throws Exception when called with invalid ID (e.g. 0)', () async {
      when(
        mockClient.get(Uri.parse('${URLs.baseURL}${URLs.classroomById}0')),
      ).thenAnswer((_) async => http.Response('Bad Request', 400));

      expect(
        () async => await controller.fetchClassroomById(0),
        throwsException,
      );
    });
  });
}
