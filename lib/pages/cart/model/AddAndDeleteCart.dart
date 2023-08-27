

class AddAndDeleteCart {
  bool? status;
  dynamic? message;
  Data ?data;

  // AddAndDeleteCart({
  //     this.status,
  //     this.message,
  //     this.data,});

  AddAndDeleteCart.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}


class CartItems {
  int? id;
  int ?quantity;
  Product? product;

  // CartItems({
  //   this.id,
  //   this.quantity,
  //   this.product,});

  CartItems.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

}


class Data {
  List<CartItems>? cartItems;
  double? subTotal;
  double? total;

  // Data({
  //   this.cartItems,
  //   this.subTotal,
  //   this.total,});

  Data.fromJson(dynamic json) {
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }



}

class Product {
  int? id;
  double? price;
  double? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  // Product({
  //   this.id,
  //   this.price,
  //   this.oldPrice,
  //   this.discount,
  //   this.image,
  //   this.name,
  //   this.description,
  //   this.images,
  //   this.inFavorites,
  //   this.inCart,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }




}