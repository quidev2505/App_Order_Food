//Đang phát triển
import 'package:flutter/material.dart';

// Mỗi OrderProductTile là 1 sản phẩm trong danh sách sản phẩm trong 1 đơn hàng
class OrderProductTile extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final int quantity;
  const OrderProductTile(
      {Key? key,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(image),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "Giá: ${price}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "Số lượng: ${quantity}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
