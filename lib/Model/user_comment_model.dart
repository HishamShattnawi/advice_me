class UserCommentModel {
  int? id = 0;
  String? userEmail;
  String? comment;
  double? rate;
  double? price;

  UserCommentModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      userEmail = json['user'];
      comment = json['comment'];
      rate = double.parse(json['rate'].toString());
      price = double.parse(json['price'].toString());
    } catch (e) {
      print("Error in UserCommentModel $e");
    }
  }
}
