import 'package:get/get.dart';
import 'package:learn_getx/app/data/employe_model.dart';

class EmployeController extends GetxController {
  final _getConnect = GetConnect();

  Future<Employe> getEmploye() async {
    final response = await _getConnect.get('http://10.10.9.77:3000/api/v1/employe');
    return Employe.fromJson(response.body);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
