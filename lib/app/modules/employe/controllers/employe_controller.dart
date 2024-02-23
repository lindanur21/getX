import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/employe_model.dart';
import '../../../providers/api.dart';

class EmployeController extends GetxController {
  var employeList = <Employe>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/employe';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        employeList
            .assignAll(jsonResponse.map((model) => Employe.fromJson(model)));
      } else {
        throw Exception('Failed to load employe');
      }
    } catch (e) {
      print('Error during fetching employe: $e');
    }
  }
}
