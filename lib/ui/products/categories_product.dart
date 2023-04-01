import 'package:flutter/material.dart';
import 'package:myproject_app/ui/products/categories_product_manager.dart';
import '../../model/food_model.dart';
import '../widget/bottom_Container.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  final String nameCategories;

  const Categories({Key? key, required this.nameCategories}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

String changeWidgetname(name) {
  if (name == "all") {
    return "Tất cả";
  } else if (name == "chicken") {
    return "Gà";
  } else if (name == "drink") {
    return "Đồ uống";
  }
  return name;
}

class _CategoriesState extends State<Categories> {
  List<FoodModel> foodCategories = [];

  @override
  Widget build(BuildContext context) {
    CategoriesProductManager categoriesProductManager =
        Provider.of<CategoriesProductManager>(context);
    categoriesProductManager.getCategoriesProduct(widget.nameCategories);
    foodCategories = categoriesProductManager.getFoodListCategories;
    return Scaffold(
      appBar: AppBar(
        title: Text(changeWidgetname(widget.nameCategories).capitalize()),
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
      body: GridView.count(
        shrinkWrap: false,
        primary: false,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: foodCategories
            .map(
              (e) => BottomContainer(foodModel: e),
            )
            .toList(),
      ),
    );
  }
}
