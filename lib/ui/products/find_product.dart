import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/food_model.dart';
import '../widget/bottom_Container.dart';

class FindProduct extends StatelessWidget {
  final String keyword;
  const FindProduct({Key? key, required this.keyword}) : super(key: key);

  Future<List<FoodModel>> findProductByKeyword(keyword) async {
    List<FoodModel> listProduct = [];

    //Khởi tại 1 thể hiện FirebaseFirestore
    final db = FirebaseFirestore.instance;

    //Danh sách các collection các danh mục sản phẩm
    List<String> nameCategoriesList = ["burger", "chicken", "pizza", "drink"];

    //Biến tạm chứa thông tin sản phẩm
    late FoodModel foodModel;

    //Danh sách tạm chứa các sản phẩm dc tìm thấy
    List<FoodModel> newCategoriesProductList = [];
    for (var i = 0; i < 4; i++) {
      await db
          .collection("foodCategories")
          .doc("eKLbrtn9ePsA7jlbT38k")
          .collection(nameCategoriesList[i])
          .get()
          .then((value) {
        for (var doc in value.docs) {
          if (doc
              .data()['name']
              .toString()
              .toLowerCase()
              .contains(keyword.toString().toLowerCase())) {
            foodModel = FoodModel(
                image: doc.data()['image'],
                name: doc.data()['name'],
                price: doc.data()['price'],
                description: doc.data()['description']);
            newCategoriesProductList.add(foodModel);
          }
        }
      });
    }
    listProduct = newCategoriesProductList;
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    //danh sách các sản phẩm được tìm thấy dựa theo keyword
    List<FoodModel> listProductFindByKeyword = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(keyword),
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: const Color(0xff2b2b2b),
      body: FutureBuilder(
        future: findProductByKeyword(keyword),
        builder: (context, AsyncSnapshot<List<FoodModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            listProductFindByKeyword = snapshot.data ?? [];
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: listProductFindByKeyword
                  .map(
                    (e) => BottomContainer(foodModel: e),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
