import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () => {},
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
              children: [
                textField(hintTextInput: "Email", icon: Icons.email),
                const SizedBox(height: 20),
                textField(hintTextInput: "Password", icon: Icons.lock_outline)
              ],
            ),
            Container(
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
              children: [
                const Text("Bạn chưa có tài khoản?"),
                const Text(
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

  Widget textField(
      {required String hintTextInput, required IconData icon, required}) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintTextInput,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
