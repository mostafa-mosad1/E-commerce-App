import 'Data.dart';

class HomeModel {
  HomeModel({
      required this.status,
      this.message, 
      required this.data,});

 factory HomeModel.fromJson(dynamic json) {
   return HomeModel(
       status : json['status'],
       message : json['message'],
       data : (json['data'] != null ? Data.fromJson(json['data']) : null)!,
   );
  }
  bool status;
  dynamic message;
  Data data;

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