// To parse this JSON data, do
//
//     final employe = employeFromJson(jsonString);

import 'dart:convert';

List<Employe> employeFromJson(String str) =>
    List<Employe>.from(json.decode(str).map((x) => Employe.fromJson(x)));

String employeToJson(List<Employe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employe {
  final int id;
  final String employeName;
  final String employeRole;
  final String? employePhoneNumber;
  final String? employeAddress;
  final DateTime createdAt;
  final DateTime updatedAt;

  Employe({
    required this.id,
    required this.employeName,
    required this.employeRole,
    required this.employePhoneNumber,
    required this.employeAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employe.fromJson(Map<String, dynamic> json) => Employe(
        id: json["id"],
        employeName: json["employe_name"],
        employeRole: json["employe_role"],
        employePhoneNumber: json["employe_phone_number"],
        employeAddress: json["employe_address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employe_name": employeName,
        "employe_role": employeRole,
        "employe_phone_number": employePhoneNumber,
        "employe_address": employeAddress,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
