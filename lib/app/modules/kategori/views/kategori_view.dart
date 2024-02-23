// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/data/kategori_model.dart';
import 'package:learn_getx/app/modules/kategori/controllers/kategori_controller.dart';

class KategoriView extends StatelessWidget {
  final KategoriController controller = Get.put(KategoriController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kategori'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-kategori');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.kategoriList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.kategoriList.length,
                itemBuilder: (context, index) {
                  var kategori = controller.kategoriList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(kategori.nama_kategori),
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
                    // subtitle: Text(Kategori),
                    // onTap: () {
                    //   // Pass the 'isEditable' flag to indicate whether it's for editing or viewing
                    //   Kategori.isEditable =
                    //       true; // Set to false for 'Lihat Detail'
                    //   controller.showKategoriDetails(Kategori());
                    // },
                  );
                },
              ),
      ),
    );
  }

  // void showDeleteConfirmation(BuildContext context, Kategori kategori) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Delete Pasien'),
  //         content: Text('Are you sure you want to delete ${kategori.namaKategori}?'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Call the deletePasien method from the controller
  //               controller.deleteKategori(Kategori());
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text('Delete'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
