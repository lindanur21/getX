import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employe_controller.dart';

class EmployeView extends StatelessWidget {
  final EmployeController controller = Get.put(EmployeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Employe'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-employe');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.employeList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.employeList.length,
                itemBuilder: (context, index) {
                  var employe = controller.employeList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(employe.employeName.toString()),
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   onPressed: () {
                        //     Get.to(() => EditPasienView(pasien: pasien));
                        //   },
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.visibility),
                        //   onPressed: () {
                        //     Get.to(() => DetailPasienView(pasien: pasien));
                        //   },
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.delete),
                        //   onPressed: () {
                        //     // Show a confirmation dialog before deleting
                        //     showDeleteConfirmation(context, pasien);
                        //   },
                        // ),
                      ],
                    ),
                    // subtitle: Text(pasien.jenisKelamin),
                    // onTap: () {
                    //   // Pass the 'isEditable' flag to indicate whether it's for editing or viewing
                    //   pasien.isEditable =
                    //       true; // Set to false for 'Lihat Detail'
                    //   controller.showPasienDetails(pasien);
                    // },
                  );
                },
              ),
      ),
    );
  }
}
