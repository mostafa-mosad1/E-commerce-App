

class ProfileModel {
  bool? status;
  dynamic? message;
  Data? data;
  // ProfileModel({
  //     this.status,
  //     this.message,
  //     this.data,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }




}

class Data {
  int? id;
  String ?name;
  String ?email;
  String ?phone;
  String ?image;
  int? points;
  int ?credit;
  String? token;

  // Data({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.points,
  //   this.credit,
  //   this.token,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }




}