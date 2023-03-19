import 'package:flutter/material.dart';
import 'package:myproject_app/ui/widget/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () => {
            print('đây là nút để về trang welcome page'),
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Đăng nhập",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              children: const [
                MyTextField(
                  hintTextInput: "Email",
                  icon: Icons.email,
                  secureText: false,
                  controller: null,
                ),
                SizedBox(height: 20),
                MyTextField(
                  hintTextInput: "Password",
                  icon: Icons.lock_outline,
                  secureText: true,
                  controller: null,
                )
              ],
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Bạn chưa có tài khoản?"),
                Text(
                  "Đăng ký ngay",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
