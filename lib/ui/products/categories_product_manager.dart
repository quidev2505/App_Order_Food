import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/food_model.dart';
import 'package:flutter/foundation.dart';

class CategoriesProductManager with ChangeNotifier {
  //mảng danh sách các sản phẩm được lấy ra từ DB
  List<FoodModel> foodModelList = [];

  //Biến tạm chứa thông tin sản phẩm
  late FoodModel foodModel;

  Future<void> getCategoriesProduct(nameCategories) async {
    List<FoodModel> newCategoriesProductList = [];

    final db = FirebaseFirestore.instance;
    await db
        .collection("foodCategories")
        .doc("eKLbrtn9ePsA7jlbT38k")
        .collection(nameCategories)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        // print(doc.id);
        foodModel = FoodModel(
            image: doc.data()['image'],
            name: doc.data()['name'],
            price: doc.data()['price']);
        newCategoriesProductList.add(foodModel);
        foodModelList = newCategoriesProductList;
        notifyListeners();
      }
    });
  }

  get getFoodListCategories {
    return foodModelList;
  }
}
