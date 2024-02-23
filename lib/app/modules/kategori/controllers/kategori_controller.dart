import 'dart:convert';

import 'package:get/get.dart';
import 'package:learn_getx/app/modules/kategori/views/show_view.dart';
import 'package:learn_getx/app/routes/app_pages.dart';

import '../../../data/kategori_model.dart';
import '../../../providers/api.dart';
import 'package:http/http.dart' as http;

class KategoriController extends GetxController {
  var kategoriList = <Kategori>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/v1/kategori';
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
  Future<void> tambahKategori(
    String namaKategori,
  ) async {
    try {
      if (namaKategori.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/v1/kategori';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'nama_kategori': namaKategori,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Kategori berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.KATEGORI);
      } else {
        throw Exception('Failed to add Kategori');
      }
    } catch (e) {
      print('Error during tambah Kategori: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit Kategori
  Future<void> editKategori(
    Kategori kategori,
    String namaKategori,
  ) async {
    try {
      if (namaKategori.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/v1/kategori/${kategori.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'nama_kategori': namaKategori,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Kategori berhasil diubah');
        fetchData();
        Get.offAndToNamed(Routes.KATEGORI);
      } else {
        throw Exception('Failed to edit Kategori');
      }
    } catch (e) {
      print('Error during edit Kategori: $e');
    }
  }

  // show Kategori
  void showKategoriDetails(Kategori kategori) {
    Get.to(() => DetailKategoriView(kategori: kategori));
  }

  // delete Kategori
  Future<void> deleteKategori(Kategori kategori) async {
    try {
      var apiUrl = '${Api.baseUrl}/v1/kategori/${kategori.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 204) {
        Get.snackbar('Sukses', 'Kategori berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete Kategori');
      }
    } catch (e) {
      print('Error during delete Kategori: $e');
    }
  }
}
