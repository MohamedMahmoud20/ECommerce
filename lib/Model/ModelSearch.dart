class ModelSearch {
  final name;
  final description;
  final image;
  final price;
  final id;

  ModelSearch(
      {required this.id,
        required this.image,
        required this.name,
        required this.description,
        required this.price});

  factory ModelSearch.fromjson(Map<String, dynamic> JsonData) {
    return ModelSearch(
        image: JsonData["image"],
        price: JsonData["price"],
        description: JsonData["description"],
        name: JsonData["name"],
        id: JsonData["id"]);
  }
}