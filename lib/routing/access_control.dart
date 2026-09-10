import 'package:school_app/core/di/injection.dart';
import 'package:school_app/session/session_key.dart';
import 'package:school_app/session/session_manager.dart';

class AccessControl {
  AccessControl._();

  static String? role() => sl<SessionManager>().read(SessionKey.role);

  static bool canAccess(Set<String> roles) {
    final currentRole = role();
    return currentRole != null && roles.contains(currentRole);
  }

  static bool get isAuthenticated =>
      sl<SessionManager>().read(SessionKey.token) != null;
}
