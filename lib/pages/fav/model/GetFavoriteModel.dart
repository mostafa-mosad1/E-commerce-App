

class GetFavoriteModel{
  bool? status;
  dynamic message;
  Data? data;

  GetFavoriteModel({
      this.status,
      this.message,
      this.data,});

  GetFavoriteModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }




}


class Data {

  int ?currentPage;
  List<Data2> ?data;
  String ?firstPageUrl;
  int ?from;
  int ?lastPage;
  String? lastPageUrl;
  dynamic? nextPageUrl;
  String ?path;
  int ?perPage;
  dynamic? prevPageUrl;
  int ?to;
  int ?total;

  // Data({
  //   this.currentPage,
  //   this.data,
  //   this.firstPageUrl,
  //   this.from,
  //   this.lastPage,
  //   this.lastPageUrl,
  //   this.nextPageUrl,
  //   this.path,
  //   this.perPage,
  //   this.prevPageUrl,
  //   this.to,
  //   this.total,});

  Data.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data2.formJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }


}

class Data2{

  int ?id;
 Product? product;
Data2.formJson(dynamic json){
  id=json["id"];
  product=Product.formJson(json["product"]);
}
}
class Product{
  dynamic ?id;
  dynamic ?price;
  dynamic ?oldPrice;
  dynamic ?discount;
  dynamic ?image;
  dynamic ?name;
  String  ?description;

//   Product({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     required this.description,
//
// });
  Product.formJson( Map<String,dynamic>json ){
    id=json["id"];
    price=json["price"];
    oldPrice=json["oldPrice"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];

  }
}