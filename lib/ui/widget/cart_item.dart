import 'package:flutter/material.dart';
import 'package:myproject_app/ui/cart/cart_manager.dart';
import 'package:provider/provider.dart';
import '../../model/cart_item_model.dart';

class CartItem extends StatefulWidget {
  final CartItemModel cartItem;

  const CartItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //Biến chứa thông tin index trong cart
  late int indexOfCartItem;

  @override
  Widget build(BuildContext context) {
    //Hàm lấy index của CartItem trong danh sách các sản phẩm trong cart
    indexOfCartItem = context
        .read<CartManager>()
        .getIndexElementNeedToDelete(widget.cartItem.foodModel.name);
    return Row(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.cartItem.foodModel.image),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartItem.foodModel.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  // const Text(
                  //   "hihiihihihi",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  Text(
                    "${widget.cartItem.foodModel.price} đ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Số lượng: ${widget.cartItem.quantity}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -5,
              child: IconButton(
                  onPressed: () => {
                        context
                            .read<CartManager>()
                            .deleteItemInCart(indexOfCartItem),
                      },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            )
          ],
        )),
      ],
    );
  }
}
