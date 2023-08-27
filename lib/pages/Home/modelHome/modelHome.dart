import 'package:flutter/cupertino.dart';

class ModelHome{
  dynamic status;
  dynamic message;
 // dataModel data;
  String ad;
  ModelHome({
    required this.status,
     required this.message,
     // required this.data,
     required this.ad});

 factory ModelHome.formJson( Map<String,dynamic> json){
return ModelHome(

    status:json["status"],
    message:json["message"],
    // data:  dataModel.formJson(json["data"]),
     ad:json["ad"],
);


 }
}

// class dataModel{
//
//   List<bannersModel> banners=[];
//   List<productsModel>  products=[];
//
//   // dataModel({
//   //   required this.banners,
//   //   required this.products});
//    dataModel.formJson( Map<String,dynamic> json ){
//
//       banners.add(dataModel.formJson(json["banners"]) as bannersModel);
//       products.add(dataModel.formJson(json["products"]) as productsModel);
//         // banners: banners,
//         // products: products
//
//   }
//
// }


class bannersModel{

  int id;
 String image;
  String category;
  String product;
  bannersModel({
   required this.id,
    required this.image,
    required this.category,
    required this.product});

  factory bannersModel.formJson( Map<String,dynamic> json){

    return bannersModel(
        id:json["id"],
        image:json["image"],
        category:json["category"],
    product:json["product"],
    );

  }
}


class productsModel{

  int id;
  int price;
  int old_price;
  int discount;
  List image;
  String name;
  String description;
  bool in_favorites;
  bool in_cart;

  productsModel(
      {
        required this.id,
        required   this.price,
        required this.old_price,
        required this.discount,
        required  this.image,
        required  this.name,
        required  this.description,
        required  this.in_cart,
        required  this.in_favorites});

  factory productsModel.formJson( Map<String,dynamic> json){

   return productsModel(
       id:json["id"],
       price:json["price"],
       old_price:json["old_price"],
   discount:json["discount"],
   image:json["image"],
   name:json["name"],
   description:json["description"],
   in_favorites:json["in_favorites"],
   in_cart:json["prodin_cartuct"],
   );




  }
}
