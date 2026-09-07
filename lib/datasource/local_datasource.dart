import 'package:school_app/models/presence.dart';
import 'package:school_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User student) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> roles = student.roles!.map((role) => role.toString()).toList();
    List<String> permissions = student.permissions!
        .map((permission) => permission.toString())
        .toList();

    prefs.setInt('userId', student.id!);
    prefs.setInt('schoolId', student.schoolId ?? 0);
    prefs.setString('fullName', student.fullName!);
    prefs.setString('email', student.email!);
    prefs.setString('token', student.token!);
    prefs.setString('accessToken', student.accessToken!);
    prefs.setStringList('roles', roles);
    prefs.setStringList('permissions', permissions);

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    int? schoolId = prefs.getInt('schoolId');
    String? name = prefs.getString('fullName');
    String? email = prefs.getString('email');
    String? token = prefs.getString('token');
    String? accessToken = prefs.getString('accessToken');
    List<String>? roles = prefs.getStringList('roles');
    List<String>? permissions = prefs.getStringList('permissions');

    return User(
      id: userId,
      schoolId: schoolId,
      fullName: name,
      email: email,
      token: token,
      accessToken: accessToken,
      roles: roles,
      permissions: permissions,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('schoolId');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('token');
    prefs.remove('accessToken');
    prefs.remove('roles');
    prefs.remove('permissions');
    prefs.remove('internshipId');
  }

  Future<bool> savePresence(List<Presence> listPresence) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int countPresent =
        listPresence.where((presence) => presence.status == 'Hadir').length;
    int countSick =
        listPresence.where((presence) => presence.status == 'Sakit').length;
    int countPermission =
        listPresence.where((presence) => presence.status == 'Izin').length;
    int countAbsent =
        listPresence.where((presence) => presence.status == 'Alpa').length;

    prefs.setInt('countPresent', countPresent);
    prefs.setInt('countSick', countSick);
    prefs.setInt('countPermission', countPermission);
    prefs.setInt('countAbsent', countAbsent);
    return true;
  }

  Future<CountPresence> getPresence() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? countPresent = prefs.getInt('countPresent');
    int? countSick = prefs.getInt('countSick');
    int? countPermission = prefs.getInt('countPermission');
    int? countAbsent = prefs.getInt('absentCount');

    return CountPresence(
      permission: countPermission,
      present: countPresent,
      sick: countSick,
      absent: countAbsent,
    );
  }

  void removeCountPresence() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('countPresent');
    prefs.remove('countSick');
    prefs.remove('countPermission');
    prefs.remove('absentCount');
  }
}
