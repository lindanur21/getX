class Employe {
  int? id;
  String? employeName;
  String? employeRole;
  String? employePhoneNumber;
  String? employeAddress;
  String? createdAt;
  String? updatedAt;

  Employe(
      {this.id,
      this.employeName,
      this.employeRole,
      this.employePhoneNumber,
      this.employeAddress,
      this.createdAt,
      this.updatedAt});

  Employe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeName = json['employe_name'];
    employeRole = json['employe_role'];
    employePhoneNumber = json['employe_phone_number'];
    employeAddress = json['employe_address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employe_name'] = this.employeName;
    data['employe_role'] = this.employeRole;
    data['employe_phone_number'] = this.employePhoneNumber;
    data['employe_address'] = this.employeAddress;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
