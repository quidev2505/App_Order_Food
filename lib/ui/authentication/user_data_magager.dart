import 'package:flutter/foundation.dart';

import '../../model/user_data.dart';
import '../../services/user_data_service.dart';

class UserDataManager with ChangeNotifier {
  late UserData userData;
  late UserDataService userDataService;

  Future<void> getUserData() async {
    userData = await userDataService.getUserData();
    notifyListeners();
  }

  // String getEmail() {
  //   return _userData.getEmail;
  // }

  // String get getFullName {
  //   return _userData.getFullName;
  // }

  // String getPhoneNumber() {
  //   return _userData.getPhoneNumber;
  // }

  // String getImage() {
  //   return _userData.getImage;
  // }
}
