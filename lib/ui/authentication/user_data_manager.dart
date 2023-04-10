import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataManager with ChangeNotifier {
  // late UserData _userData;
  late String _email;
  late String _fullName;
  late String _phoneNumber;
  late String _image;

  Future<void> getUserData() async {
    // UserData userData;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final emailLogin = prefs.getString('userEmailLogin');

    //Tạo đối tượng DB
    final db = FirebaseFirestore.instance;

    var userInfo;
    //Lấy thông tin người dùng trong DB
    if (emailLogin != null) {
      await db
          .collection("userData")
          .where("email", isEqualTo: emailLogin)
          .get()
          .then((querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          userInfo = docSnapshot.data();
        }
      });
    }

    _email = userInfo['email'];
    _fullName = userInfo['fullName'];
    _phoneNumber = userInfo['phoneNumber'];
    _image = userInfo['image'];
    notifyListeners();
  }

  String get email => _email;
  String get fullName => _fullName;
  String get phoneNumber => _phoneNumber;
  String get image => _image;
}
