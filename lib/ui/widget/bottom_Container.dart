import 'package:flutter/material.dart';
import '../../model/food_model.dart';
import '../products/detail_product.dart';

class BottomContainer extends StatelessWidget {
  // final String image;
  // final int price;
  // final String name;
  final FoodModel foodModel;
  const BottomContainer({Key? key, required this.foodModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        width: 220,
        decoration: BoxDecoration(
            color: const Color(0xff3a3e3e),
            borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailProduct(
                        foodModel: foodModel,
                      )));
            },
            child: CircleAvatar(
              // radius: 60,
              maxRadius: 50,
              backgroundImage: NetworkImage(foodModel.image),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              children: [
                Text(
                  foodModel.name,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "${foodModel.price} đ",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
                Icon(Icons.star, size: 20, color: Colors.white),
              ],
            ),
          )
        ]));
  }
}
