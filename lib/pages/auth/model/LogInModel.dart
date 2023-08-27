
class LogInModel {
  bool status;
  String message;
  UserData data;

  LogInModel({
      required this.status,
      required this.message,
      required this.data,});

 factory LogInModel.fromJson( Map<String,dynamic> json ) {
    return LogInModel(
        status : json['status'],
        message : json['message'],
        data : (json['data'] != null ? UserData.fromJson(json['data']) : null)!
    );
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['status'] = status;
  //   map['message'] = message;
  //   if (data != null) {
  //     map['data'] = data.toJson();
  //   }
  //   return map;
  // }

}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,});

 factory UserData.fromJson( Map<String,dynamic> json ) {
   return UserData(
       id : json['id'],
       name : json['name'],
       email : json['email'],
   phone : json['phone'],
   image : json['image'],
   points : json['points'],
   credit : json['credit'],
   token : json['token'],
   );
  }


  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['phone'] = phone;
  //   map['image'] = image;
  //   map['points'] = points;
  //   map['credit'] = credit;
  //   map['token'] = token;
  //   return map;
  // }

}