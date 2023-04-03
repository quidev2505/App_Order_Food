import 'package:flutter/material.dart';
import 'package:myproject_app/model/cart_item_model.dart';
import 'package:provider/provider.dart';
import '../widget/cart_item.dart';
import 'cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${context.watch<CartManager>().getTotal} đ",
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const Text(
              "Đặt hàng",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: context.watch<CartManager>().cartItemListLength,
        itemBuilder: (context, index) {
          List<CartItemModel> cartItemList = [];
          cartItemList = context.watch<CartManager>().getCartItemList;
          return CartItem(cartItem: cartItemList[index]);
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
