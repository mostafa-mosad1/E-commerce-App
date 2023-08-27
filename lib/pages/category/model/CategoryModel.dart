import 'Data.dart';

class CategoryModel {
  bool status;
  dynamic message;
  Data data;
  CategoryModel({
      required this.status,
      this.message, 
      required this.data,});

 factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
        status : json['status'],
        message : json['message'],
        data : (json['data'] != null ? Data.fromJson(json['data']) : null)!,
        );
  }

}

class Data{
  int? current_page;
 List<Data2> ?data;
 String ?first_page_url;
int ?from;

  // Data({
  //    this.current_page,
  //    this.id,
  //    this.name,
  //    this.image,
  //   required this.data});

  Data.fromJson(Map<String,dynamic> json){

        current_page = json["current_page"];
        if(json["data"] != null){
          data=[];
          json["data"].forEach((e){
            data?.add(Data2.formJson(e));
          });
        }
        first_page_url = json["first_page_url"];
        from=json["from"];

  }
}
class Data2{
  int id;
  String name;
  String image;
Data2({
  required this.id,
  required this.name,
  required this.image,
  });
factory Data2.formJson(Map<String,dynamic> json){
  return Data2(
      id: json["id"],
      name: json["name"],
      image: json["image"]);
}

}
