class UserData {
  final String email;
  final String fullName;
  final String image;
  final String phoneNumber;

  UserData({
    required this.email,
    required this.fullName,
    required this.image,
    required this.phoneNumber,
  });

  String get getEmail {
    return email;
  }

  String get getFullName {
    return fullName;
  }

  String get getImage {
    return image;
  }

  String get getPhoneNumber {
    return phoneNumber;
  }

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      fullName: json['fullName'],
      image: json['image'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'image': image,
      'phoneNumber': phoneNumber,
    };
  }
}
