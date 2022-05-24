// ignore_for_file: prefer_typing_uninitialized_variables, file_names, non_constant_identifier_names

class ModelAddaddress {
  final name;
  final details;
  final city;
  final notes;
  final region;

ModelAddaddress(
    {required this.notes,
      required this.region,
      required this.name,
      required this.details,
      required this.city});

factory ModelAddaddress.fromjson(Map<String, dynamic> JsonData) {
return ModelAddaddress(
city: JsonData["city"],
region: JsonData["region"],
details: JsonData["details"],
name: JsonData["name"],
notes: JsonData["notes"]);
}
}
