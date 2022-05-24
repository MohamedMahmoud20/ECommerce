class ModelCategories {
  final name;
  final image;
  final id;

  ModelCategories(
      {
        required this.image,
        required this.name,
        required this.id});

  factory ModelCategories.fromjson(Map<String, dynamic> JsonData) {
    return ModelCategories(
        image: JsonData["Image"],
        id: JsonData["id"],

        name: JsonData["name"],
      );
  }
}
