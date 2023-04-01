import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/food_model.dart';
import 'package:flutter/foundation.dart';

class FoodHomePageManager with ChangeNotifier {
  List<FoodModel> foodModelList =
      []; //Tạo mảng rỗng để chứa danh sách các sản phẩm lấy ra để hiển thị ra trang chủ
  late FoodModel
      foodModel; //Tạo biến tạm để chứa thông tin 1 sản phẩm rồi đưa từng phần tử vào mảng foodModelList
  Future<void> getFoodList() async {
    List<FoodModel> newFoodModelList = [];
    final db = FirebaseFirestore.instance;
    await db.collection("foodHomePage").get().then((value) {
      for (var doc in value.docs) {
        foodModel = FoodModel(
            image: doc.data()['image'],
            name: doc.data()['name'],
            price: doc.data()['price'],
            description: doc.data()['description']);
        newFoodModelList.add(foodModel);
        foodModelList = newFoodModelList;

        notifyListeners();
      }
    });
  }

  get getFoodListHomePage {
    return foodModelList;
  }
}
