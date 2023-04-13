import 'package:flutter/material.dart';
import 'package:myproject_app/model/food_model.dart';
import '../../model/cart_item_model.dart';
import 'package:flutter/foundation.dart';

class CartManager with ChangeNotifier {
  //Danh sách các item của cart
  List<CartItemModel> cartItemList = [];

  //Biến chứa thông tin tổng đơn hàng
  int total = 0;

  //Biến tạm chứa thông tin 1 cart item
  late CartItemModel cartItem;

  List<CartItemModel> newCartItemList = [];
  void addToCart({required FoodModel food, required int quantity}) {
    cartItem = CartItemModel(foodModel: food, quantity: quantity);
    bool isExist = false;
    cartItemList.forEach((element) {
      if (element.foodModel.name == food.name) {
        element.quantity += quantity;
        isExist = true;
      }
    });
    if (isExist == false) {
      newCartItemList.add(cartItem);
      cartItemList = newCartItemList;
    }
    notifyListeners();
  }

  // Lấy index của phần tử cần xóa
  int getIndexElementNeedToDelete(name) {
    int indexItem = 0;

    for (var i = 0; i < cartItemList.length; i++) {
      if (cartItemList[i].foodModel.name == name) {
        indexItem = i;
      }
    }
    return indexItem;
  }

  // Hàm xóa
  void deleteItemInCart(index) {
    cartItemList.removeAt(index);
    notifyListeners();
  }

  //Hàm xóa All giỏ hàng
  void deleteAllCart() {
    cartItemList = [];
    newCartItemList = [];
    notifyListeners();
  }

  get getCartItemList {
    return cartItemList;
  }

  get cartItemListLength {
    return cartItemList.length;
  }

  get getTotal {
    total = 0;
    cartItemList.forEach((element) {
      total += element.quantity * element.foodModel.price;
    });
    return total;
  }
}
