class ModelPutAddress {
  final name;
  final details;
  final city;
  final notes;
  final region;

  ModelPutAddress(
      {required this.notes,
        required this.region,
        required this.name,
        required this.details,
        required this.city});

  factory ModelPutAddress.fromjson(Map<String, dynamic> JsonData) {
    return ModelPutAddress(
        city: JsonData["city"],
        region: JsonData["region"],
        details: JsonData["details"],
        name: JsonData["name"],
        notes: JsonData["notes"]);
  }
}