import 'package:flutter/material.dart';
import 'package:myproject_app/ui/authentication/login_page.dart';
import 'package:myproject_app/ui/authentication/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  Widget button({required String nameButton, Color? color, Color? textColor}) {
    return SizedBox(
      height: 60,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.green, width: 2), //viền của sizebox
            borderRadius: BorderRadius.circular(30),
          ),
        ),
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
            child: Center(
              child: Image.asset('assets/images/logo.jpg'),
            ),
          ),
          Expanded(
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
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Đăng nhập'),
                ),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.green),
                      minimumSize:
                          MaterialStateProperty.all(const Size(300, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.green)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: const Text('Đăng ký'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
