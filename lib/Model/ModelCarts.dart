class ModelCarts {
  final name;
  final image;
  final price;
  final id;
  final quantity;

  ModelCarts(
      {required this.id,
        required this.name,
        required this.image,
        required this.quantity,
        required this.price});

  factory ModelCarts.fromjson(Map<String, dynamic> JsonData) {
    return ModelCarts(
        price: JsonData["product"]["price"],
        image: JsonData["product"]["image"],
        name: JsonData["product"]["name"],
        id: JsonData["id"],
        quantity: JsonData["quantity"]
    );
  }
}