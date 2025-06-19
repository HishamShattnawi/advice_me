class User {
  String fullName = "";
  String email = "";
  String password = "";
  String phone = "";
  DateTime berthDate = DateTime.now();

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.berthDate,
  });
  User.fromJson(Map<String, dynamic> json) {
    try {
      fullName = json['fullName'];
      email = json['email'];
      password = json['password'];
      phone = json['phone'];
      berthDate = DateTime.parse(json['berthDate']);
    } catch (e) {
      print("Error in User.fromJson : $e");
    }
  }
}
