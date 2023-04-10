import 'food_model.dart';

class CartItemModel {
  final FoodModel foodModel;
  late int quantity;

  CartItemModel({
    required this.foodModel,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      //Các key kiểu String là các field được lưu trong collection order
      "product_name": foodModel.name,
      "image": foodModel.image,
      "price": foodModel.price,
      "quantity": quantity,
    };
  }
}
