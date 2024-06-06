import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/activity.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/student.dart';
import '../../domain/entities/transaction.dart';

abstract class StudentRemoteDatasource {
  Future<StudentEntity> getStudentData(String id);
  Future<List<TransactionEntity>> getHistoryTransaction();
  Future<List<ActivityStudentEntity>> getActivityStudent();
  Future<List<EventEntity>> getEvent();
}

class StudentRemoteDatasourceImplementation extends StudentRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<StudentEntity> getStudentData(String id) async {
    DocumentSnapshot doc = await _firestore.collection("student").doc(id).get();

    throw UnimplementedError();
  }

  @override
  Future<List<ActivityStudentEntity>> getActivityStudent() {
    throw UnimplementedError();
  }

  @override
  Future<List<EventEntity>> getEvent() {
    throw UnimplementedError();
  }

  @override
  Future<List<TransactionEntity>> getHistoryTransaction() {
    throw UnimplementedError();
  }
}
