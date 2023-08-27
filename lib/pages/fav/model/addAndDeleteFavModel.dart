

class AddAndDeleteFavModel {
  bool status;
  dynamic message;
  Data data;

  AddAndDeleteFavModel({
    required this.status,
  required this.message,
  required this.data,

});
  factory AddAndDeleteFavModel.formJson( dynamic json){
    return AddAndDeleteFavModel(
        status: json["status"],
        message: json["message"],
        data: (json["message"] !=null?Data.formJson(json["message"]):null)!
    );
  }
}

class Data{
  dynamic ?id;
  Product? product;


   Data.formJson(dynamic json){

        id= json["id"];
        product= (json["product"] != null?Product.formJson(json["product"]):null)!;


  }
}

class Product {

  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
});

  factory Product.formJson(dynamic json){
   return Product(id : json['id'],
     price : json['price'],
     oldPrice : json['old_price'],
     discount : json['discount'],
     image : json['image'],);
  }
}