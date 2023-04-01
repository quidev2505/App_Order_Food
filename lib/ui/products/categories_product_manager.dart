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

    //Nếu loại là Tất cả
    if (nameCategories == "all") {
      List<String> nameCategoriesList = ["burger", "chicken", "pizza", "drink"];
      for (var i = 0; i < 4; i++) {
        await db
            .collection("foodCategories")
            .doc("eKLbrtn9ePsA7jlbT38k")
            .collection(nameCategoriesList[i])
            .get()
            .then((value) {
          for (var doc in value.docs) {
            // print(doc.id);
            foodModel = FoodModel(
                image: doc.data()['image'],
                name: doc.data()['name'],
                price: doc.data()['price']);
            newCategoriesProductList.add(foodModel);
          }
        });
      }
      foodModelList = newCategoriesProductList;
    } else {
      //Nếu là 1 loại cụ thể
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
        }
      });
    }
    notifyListeners();
  }

  get getFoodListCategories {
    return foodModelList;
  }
}
