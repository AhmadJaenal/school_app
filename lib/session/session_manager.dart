import 'package:get_storage/get_storage.dart';

abstract class SessionManager {
  Future<void> write(String key, String value);

  String? read(String key);

  double? readDouble(String key);

  Future<void> remove(String key);

  Future<void> clear();

  Future<void> writeMap(String key, Map<String, dynamic> value);

  Map<String, dynamic>? readMap(String key);
}

class SessionManagerImpl extends SessionManager {
  final _box = GetStorage();

  @override
  String? read(String key) {
    try {
      var result = _box.read(key);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  double? readDouble(String key) {
    try {
      var result = _box.read(key);
      return double.parse(result);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> remove(String key) async {
    return await _box.remove(key);
  }

  @override
  Future<void> write(String key, String value) async {
    return await _box.write(key, value);
  }

  @override
  Future<void> writeMap(String key, Map<String, dynamic> value) async {
    return await _box.write(key, value);
  }

  @override
  Future<void> clear() async {
    return await _box.erase();
  }

  @override
  Map<String, dynamic>? readMap(String key) {
    try {
      return _box.read(key);
    } catch (e) {
      return null;
    }
  }
}
