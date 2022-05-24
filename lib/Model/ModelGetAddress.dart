class ModelGetAddress {
  final name;
  final details;
  final city;
  final notes;
  final region;

  ModelGetAddress(
      {required this.notes,
        required this.region,
        required this.name,
        required this.details,
        required this.city});

  factory ModelGetAddress.fromjson(Map<String, dynamic> JsonData) {
    return ModelGetAddress(
        city: JsonData["city"],
        region: JsonData["region"],
        details: JsonData["details"],
        name: JsonData["name"],
        notes: JsonData["notes"]);
  }
}