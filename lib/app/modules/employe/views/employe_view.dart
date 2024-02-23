import 'package:flutter/material.dart';
import 'package:learn_getx/app/data/employe_model.dart';
import 'package:get/get.dart';
import '../controllers/employe_controller.dart';

class EmployeView extends GetView<EmployeController> {
  const EmployeView({super.key});
  @override
  Widget build(BuildContext context) {
    EmployeController controller = Get.put(EmployeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeView'),
        centerTitle: true,
      ),
      // body: FutureBuilder<Employe>(
      //   future: controller.getEmploye(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: Text(
      //           'Cek Data',
      //           style: TextStyle(
      //             fontSize: 20,
      //           ),
      //         ),
      //       );
      //     }

      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: Text('Tidak Ada Data'),
      //       );
      //     }
      //     var employe = snapshot.data!.;
      //     return ListView.builder(
      //       itemCount: employe.length,
      //       itemBuilder: (context, index) {
      //         return Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(employe[index].employe_name),
      //             Text(employe[index].employe_role),
      //             Text(employe[index].employe_address),
      //           ],
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
