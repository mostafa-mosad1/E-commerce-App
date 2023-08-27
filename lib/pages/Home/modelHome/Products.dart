class Products {
  Products({
      required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.inFavorites,
      required this.inCart,});

 factory Products.fromJson(dynamic json) {
    return Products(
        id : json['id'],
        price : json['price'],
        oldPrice : json['old_price'],
    discount : json['discount'],
    image : json['image'],
    name : json['name'],
    description : json['description'],
    images : json['images'] != null ? json['images'].cast<String>() : [],
   inFavorites : json['in_favorites'],
   inCart : json['in_cart'],
    );
  }
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  dynamic image;
  dynamic name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['price'] = price;
  //   map['old_price'] = oldPrice;
  //   map['discount'] = discount;
  //   map['image'] = image;
  //   map['name'] = name;
  //   map['description'] = description;
  //   map['images'] = images;
  //   map['in_favorites'] = inFavorites;
  //   map['in_cart'] = inCart;
  //   return map;
  // }

}