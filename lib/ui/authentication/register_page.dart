import 'package:flutter/material.dart';
import 'package:myproject_app/ui/widget/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation() {
    if (fullName.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Họ và tên chưa được điền",
          ),
        ),
      );
      return;
    }

    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email chưa được điền",
          ),
        ),
      );
      return;
    } else {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);
      if (!regex.hasMatch(email.text.trim())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Email chưa hợp lệ",
            ),
          ),
        );
        return;
      }
    }

    if (phoneNumber.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Số điện thoại chưa được điền",
          ),
        ),
      );
      return;
    } else {
      const pattern = r"^(?:[+0]9)?[0-9]{10}$";
      final regex = RegExp(pattern);
      if (!regex.hasMatch(phoneNumber.text.trim())) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Số điện thoại chưa hợp lệ",
            ),
          ),
        );
        return;
      }
    }

    if (password.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Mật khẩu chưa được điền",
          ),
        ),
      );
      return;
    } else if (password.text.trim().length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Mật khẩu phải có tối thiểu 6 ký tự",
          ),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Đăng ký",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              MyTextField(
                controller: fullName,
                hintTextInput: "Họ và tên",
                icon: Icons.people,
                secureText: false,
              ),
              MyTextField(
                controller: email,
                hintTextInput: "Email",
                icon: Icons.email,
                secureText: false,
              ),
              MyTextField(
                controller: phoneNumber,
                hintTextInput: "Số điện thoại",
                icon: Icons.phone_android,
                secureText: false,
              ),
              MyTextField(
                controller: password,
                hintTextInput: "Mật khẩu",
                icon: Icons.lock_outline,
                secureText: true,
              ),
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
                "Đăng ký",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                validation();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Nếu đã có tài khoản?"),
              Text(
                "Đăng nhập ngay",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
