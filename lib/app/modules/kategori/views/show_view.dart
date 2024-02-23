import 'package:flutter/material.dart';
import 'package:learn_getx/app/data/kategori_model.dart';

class DetailKategoriView extends StatelessWidget {
  final Kategori kategori;

  DetailKategoriView({required this.kategori});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${kategori.namaKategori}'),
          ],
        ),
      ),
    );
  }
}
