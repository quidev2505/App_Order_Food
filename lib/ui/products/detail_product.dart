import 'package:flutter/material.dart';
import 'package:myproject_app/ui/cart/cart_page.dart';
import 'package:provider/provider.dart';
import '../../model/food_model.dart';
import '../cart/cart_manager.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key, required this.foodModel}) : super(key: key);
  final FoodModel foodModel;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int quantity = 1;

  void changeQuantity(type) {
    if (type == "add") {
      quantity++;
    } else {
      if (quantity == 1) {
        quantity = 1;
      } else {
        quantity--;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // CartManager cartManager = Provider.of<CartManager>(context);

    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      appBar: AppBar(
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
      body: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(widget.foodModel.image),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff3a3e3e),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodModel.name,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => {changeQuantity("minus")},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => {changeQuantity("add")},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.foodModel.price} đ",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  const Text(
                    "Mô tả",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.foodModel.description,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2b2b2b),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          context.read<CartManager>().addToCart(
                              food: widget.foodModel, quantity: quantity);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shopping_cart, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Thêm vào giỏ hàng",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
