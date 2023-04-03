import 'food_model.dart';

class CartItemModel {
  final FoodModel foodModel;
  late int quantity;

  CartItemModel({
    required this.foodModel,
    required this.quantity,
  });
}
