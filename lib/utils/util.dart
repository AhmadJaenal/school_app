import 'package:school_app/network/urls.dart';

class BaseUrlUtils {
  final String url = URLs.host;

  String getUrlDevice() {
    return '$url/api/';
  }
}
