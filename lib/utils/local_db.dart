// import 'package:hive/hive.dart';
// import 'package:school_app/models/user.dart';

// class HiveBoxes {
//   static const userDetails = 'user_details';
//   static Box userDetailsBox() => Hive.box(userDetails);

//   static initialize() async {
//     await Hive.openBox(userDetails);
//   }

//   static clearAllBox() async {
//     await HiveBoxes.userDetailsBox().clear();
//   }
// }

// class localDB {
//   static User getStudent() => User.fromJson(HiveBoxes.userDetailsBox().toMap());

//   static String getStudentName() =>
//       HiveBoxes.userDetailsBox().toMap()[User.nameKey];

//   static String getStudentArray() =>
//       HiveBoxes.userDetailsBox().toMap()[User.arrayKey];

//   static setStudentDetails(User student) =>
//       HiveBoxes.userDetailsBox().putAll(student.toJson());
// }
