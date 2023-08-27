
//
// class SearchModel {
//   bool ?status;
//   dynamic? message;
//   Data ?data;
//
//   // SearchModel({
//   //     this.status,
//   //     this.message,
//   //     this.data,});
//
//   SearchModel.fromJson(dynamic json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//
//
// }
//
//
//
// class Data {
//
//   int? currentPage;
//   List<Data>? data;
//   String? firstPageUrl;
//   int ?from;
//   int ?lastPage;
//   String? lastPageUrl;
//   dynamic? nextPageUrl;
//   String ?path;
//   int? perPage;
//   dynamic? prevPageUrl;
//   int ?to;
//   int ?total;
//
//   // Data({
//   //   this.currentPage,
//   //   this.data,
//   //   this.firstPageUrl,
//   //   this.from,
//   //   this.lastPage,
//   //   this.lastPageUrl,
//   //   this.nextPageUrl,
//   //   this.path,
//   //   this.perPage,
//   //   this.prevPageUrl,
//   //   this.to,
//   //   this.total,});
//
//   Data.fromJson(dynamic json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//
//
//}

class SearchModel {
  bool ?status;
  dynamic? message;
  Data ?data;

  // SearchModel({
  //     this.status,
  //     this.message,
  //     this.data,});

  SearchModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data{
  int ?current_page;
  List<Data2> ?data =[];
  String ?first_page_url;


  Data.fromJson(dynamic json) {
    current_page = json['current_page'];
    if(json["data"] != null){
      data =[];
      json["data"].forEach((v){
        data?.add(Data2.fromJson(v));
      });
    }
    first_page_url = json['first_page_url'];

  }

}


class Data2{
  dynamic? id;
  dynamic? price;
 String ?image;
  String ?name;
  String ?description;
  List ?images;
  bool ? in_favorites;
  bool ?in_cart;

  Data2.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    images = json["images"];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}