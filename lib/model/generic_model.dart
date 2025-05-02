class GenericModel {
  bool success = false;
  int status = 0;
  List<String> message = [];

  GenericModel();

  GenericModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["status"] is int) {
      status = json["status"];
    }
    if (json["message"] is List<dynamic>) {
      message = List<String>.from(json["message"]);
    }
  }
}
