import 'package:flutter/material.dart';
import 'package:school_app/models/user.dart';

class UserProvider with ChangeNotifier {
  User _student = User();

  User get student => _student;

  void setStudent(User student) {
    _student = student;
    notifyListeners();
  }
}
