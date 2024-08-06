class Login {
  String? name;
  String? email;
  String? password;
  List<dynamic>? response;
  int statusCode = 400;
  String? responseCode = "-700";
  bool isConnectionSuccessful() => statusCode == 200;
  bool isRequestSuccessful() => responseCode == "100";
  Login(
      {this.name, this.response, this.email, this.password, this.responseCode});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      name: json["success"],
      response: json["message"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "response": response,
    };
  }
}
