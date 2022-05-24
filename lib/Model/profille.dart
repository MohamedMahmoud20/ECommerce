// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

class ModelProfile {
  final name;
  // final email;
  // final image;
  // final id;
  // final token;

  ModelProfile(
      {
        required this.name
        // required this.email,
      //   required this.image,
      //   required this.id,
      //   required this.token
    });

  factory ModelProfile.fromjson(Map<String, dynamic> JsonData) {
    return ModelProfile(
        name:  JsonData["name"]
        // image: JsonData["image"],
        // token: JsonData["token"],
        // email: JsonData["email"],
        //  id:  JsonData["id"],
 );
  }
}
