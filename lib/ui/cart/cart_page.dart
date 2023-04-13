import 'package:flutter/material.dart';
import 'package:myproject_app/model/cart_item_model.dart';
import 'package:provider/provider.dart';
import '../authentication/user_data_manager.dart';
import '../widget/cart_item.dart';
import 'cart_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late String fullName;
  late String email;
  late String phoneNumber;
  //biến products chứa danh sách sản phẩm trong giỏ hàng
  List<CartItemModel> products = [];

  //biến products_convert_tomap để chứa danh sách sản phẩm sau khi convert thành Map<String, dynamic> để thêm vào CSDL
  List<Map<String, dynamic>> products_convert_tomap = [];

  TextEditingController address = TextEditingController();
  //total chứa tổng đơn hàng
  int total = 0;

  Future<void> createOrder(
      fullName, email, phoneNumber, products_convert_tomap, total) async {
    await FirebaseFirestore.instance.collection('order').doc().set({
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address.text,
      'product': products_convert_tomap,
      'total': total,
    });
    //Thông báo đăng ký tài khoản thành công
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Đặt hàng thành công !",
        ),
      ),
    );
  }

  void validation(fullName, email, phoneNumber, products_convert_tomap, total) {
    if (address.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Bạn phải điền địa chỉ để đặt hàng",
          ),
        ),
      );
      return;
    } else if (address.text.trim().length < 12) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Địa chỉ phải lớn hơn 12 kí tự !",
          ),
        ),
      );
      return;
    } else {
      createOrder(fullName, email, phoneNumber, products_convert_tomap, total);
      context.read<CartManager>().deleteAllCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    UserDataManager userDataManager =
        Provider.of<UserDataManager>(context, listen: false);
    userDataManager.getUserData();

    fullName = userDataManager.fullName;
    email = userDataManager.email;
    phoneNumber = userDataManager.phoneNumber;
    products = context
        .watch<CartManager>()
        .getCartItemList; //biến products chứa danh sách các sản phẩm trong giỏ hàng

    products_convert_tomap =
        products.map<Map>((e) => e.toMap()).toList().cast();

    total = context.watch<CartManager>().getTotal;
    // print(fullName);
    // print(email);
    // print(phoneNumber);
    // print(products.map<Map>((e) => e.toMap()).toList());

    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.all(
          20,
        ),
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${context.watch<CartManager>().getTotal} đ",
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            GestureDetector(
              onTap: () => {
                validation(
                    fullName, email, phoneNumber, products_convert_tomap, total)
              },
              child: const Text(
                "Đặt hàng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
          title: const Text("Giỏ hàng"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
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
          ),
          TextField(
            controller: address,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: "Địa chỉ",
              labelStyle: TextStyle(fontSize: 25, color: Colors.white),
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 30,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
