import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static final String baseUrl = 'http://10.10.9.77:3000/api';

  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    if (token != null) {
      return {'Authorization': 'Bearer $token'};
    } else {
      return {};
    }
  }
}
