import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_data.dart';

class UserDataService {
  //Hàm lấy email từ shared_preference
  UserDataService();

  Future<UserData> getUserData() async {
    late final UserData userData;

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final emailLogin = prefs.getString('userEmailLogin');

      //Tạo đối tượng DB
      final db = FirebaseFirestore.instance;
      //Lấy thông tin người dùng trong DB

      //Tạo biến tạm
      var userInfo;
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
      // print(userInfo);
      userData = UserData.fromJson(userInfo);
      // return userInfo;
      return userData;
    } catch (e) {
      print(e);
      return userData;
    }
  }
}
