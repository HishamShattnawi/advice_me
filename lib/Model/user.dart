class User {
  String fullName = "";
  String email = "";
  String password = "";
  bool genderMale = true;
  String berthDate = "";

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.genderMale,
    required this.berthDate,
  });
  User.fromJson(Map<String, dynamic> json) {
    try {
      fullName = json['fullName'];
      email = json['email'];
      password = json['password'];
      genderMale = json['genderMale'];
      berthDate = json['berthDate'];
    } catch (e) {
      print("Error in User.fromJson : $e");
    }
  }
}
