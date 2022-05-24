class ModelProduct {
  bool? status;
  String? message;
  Data? data;

  ModelProduct({
    this.status,
    this.message,
    this.data,
  });

  ModelProduct.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data!.toJson();
    return map;
  }
}

class Data {
  List<CartProduct>? cartItems;
  int? subTotal;
  int? total;

  Data({
    this.cartItems,
    this.subTotal,
    this.total,
  });

  Data.fromJson(dynamic json) {
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartProduct.fromJson(v));
      });
    }
    subTotal = json['sub_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    map['sub_total'] = subTotal;
    map['total'] = total;
    return map;
  }
}

class CartProduct {
  int? id;
  int? quantity;
  Product? product;

  CartProduct({
    this.id,
    this.quantity,
    this.product,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      quantity: json['quantity'],
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['quantity'] = quantity;
    map['product'] = product!.toJson();

    return map;
  }
}

class Product {
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  String? name;
  String? description;
  List<dynamic> images;
  bool? inFavorites;
  bool? inCart;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    required this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: json['images'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['discount'] = discount;
    map['image'] = image;
    map['description'] = description;
    map['images'] = images;
    map['in_favorites'] = inFavorites;
    map['in_cart'] = inCart;

    return map;
  }
}
