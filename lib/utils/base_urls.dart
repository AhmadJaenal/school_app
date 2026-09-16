import 'package:school_app/network/urls.dart';

class BaseUrlUtils {
  final String url = URLs.host;
  final String apiVersion = URLs.apiVersion;

  String getUrlDevice() {
    return '$url/api/$apiVersion/';
  }
}
