//Đang phát triển
import 'package:flutter/material.dart';
import './order_product_tile.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return OrderProductTile(
              name: "Burger",
              price: 10,
              image:
                  "https://static.kfcvietnam.com.vn/images/items/lg/BJ.jpg?v=LZY5X3",
              quantity: 5);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 50,
            thickness: 5,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
