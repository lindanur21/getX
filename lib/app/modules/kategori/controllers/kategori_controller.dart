// pasien_controller.dart
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn_getx/app/data/kategori_model.dart';

import '../../../providers/api.dart';
import '../../../routes/app_pages.dart';

class KategoriController extends GetxController {
  var kategoriList = <Kategori>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/kategori';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['rows'];
        kategoriList
            .assignAll(jsonResponse.map((model) => Kategori.fromJson(model)));
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print('Error during fetching kategori: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahKategori(String nama) async {
    try {
      if (nama.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/kategori';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {'nama': nama},
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Kategori berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman pasien
      } else {
        throw Exception('Failed to add kategori');
      }
    } catch (e) {
      print('Error during tambah kategori: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit pasien
  // Future<void> editPasien(
  //   Kategori kategori,
  //   String nama,
  // ) async {
  //   try {
  //     if (nama.isEmpty) {
  //       Get.snackbar('Error', 'Semua field harus diisi');
  //       return;
  //     }

  //     var apiUrl = '${Api.baseUrl}/kategori/${kategori.id}';
  //     var headers = await Api.getHeaders();

  //     var response = await http.put(
  //       Uri.parse(apiUrl),
  //       headers: headers,
  //       body: {
  //         'nama': nama,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       Get.snackbar('Sukses', 'Kategori berhasil diubah');
  //       fetchData(); // Refresh the pasienList
  //       Get.offAndToNamed(Routes.BOTTOM_MENU);
  //     } else {
  //       throw Exception('Failed to edit kategori');
  //     }
  //   } catch (e) {
  //     print('Error during edit kategori: $e');
  //   }
  // }

  // show pasien
  // void showPasienDetails(Kategori kategori) {
  //   Get.to(() => DetailKategoriView(kategori: kategori));
  // }

  // delete pasien
  // Future<void> deleteKategori(Kategori kategori) async {
  //   try {
  //     var apiUrl = '${Api.baseUrl}/kategori/${kategori.id}';
  //     var headers = await Api.getHeaders();

  //     var response = await http.delete(
  //       Uri.parse(apiUrl),
  //       headers: headers,
  //     );

  //     if (response.statusCode == 200) {
  //       Get.snackbar('Sukses', 'Kategori berhasil dihapus');
  //       fetchData();
  // Optionally, you can navigate to a different page after deletion
  //     } else {
  //       throw Exception('Failed to delete kategori');
  //     }
  //   } catch (e) {
  //     print('Error during delete kategori: $e');
  //   }
  // }
}
