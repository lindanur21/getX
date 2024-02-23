// pasien_model.dart
class Kategori {
  int id;
  String nama_kategori;
  bool isEditable; // Add this property

 Kategori({
    required this.id,
    required this.nama_kategori,
    this.isEditable = false, // Set default value to false
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      nama_kategori: json['nama'],
    );
  }
}
