//Đang phát triển
import 'package:flutter/material.dart';
import './order_tile.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Đơn hàng đã mua"),
        ),
        backgroundColor: const Color(0xff2b2b2b),
        body: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            OrderTile(),
          ],
        ));
  }
}
