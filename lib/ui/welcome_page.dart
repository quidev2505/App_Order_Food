import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Widget button({required String nameButton, Color? color, Color? textColor}) {
    return Container(
      height: 60,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          nameButton,
          style: TextStyle(
            color: textColor,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Chào mừng đến với FoodTaste",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "Đặt hàng thức ăn trực tuyến ở nhà hàng của chúng tôi và thưởng thức đi nào",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  button(
                      nameButton: "Đăng nhập",
                      color: Colors.green,
                      textColor: Colors.white),
                  button(
                      nameButton: "Đăng ký",
                      color: Colors.white,
                      textColor: Colors.green),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
