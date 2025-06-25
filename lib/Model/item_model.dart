import 'package:advice_me/Model/user_comment_model.dart';
import 'package:advice_me/Util/constants_values.dart';

class ItemModel {
  int? id;
  String? image;
  String? name;
  double? rate;
  int? rateCount;
  double? price;
  int? categoryID;
  Category? category;
  String? barcode;
  String? description;
  List<String>? advantages;
  List<String>? disadvantages;
  List<UserCommentModel> comments = [];

  ItemModel.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      image = json['image'];
      name = json['name'];
      rate = double.parse(json['rate'].toString());
      rateCount = json['rateCount'];
      price = double.parse(json['price'].toString());
      categoryID = int.parse(json['category'].toString());
      barcode = json['barcode'];
      description = json['description'];
      advantages = (json['advantages'] as List<dynamic>)
          .map((e) => e.toString())
          .toList();
      disadvantages = (json['disadvantages'] as List<dynamic>)
          .map((e) => e.toString())
          .toList();

      for (var element in json['comments']) {
        comments.add(UserCommentModel.fromJson(element));
      }
      category = Category.values.elementAt(categoryID ?? 5);
    } catch (e) {
      print("Error in ItemModel $e");
    }
  }
}
