// class UserModel {
//   final String name;
//   final String email;
//   final String phone;
//   final String password;

//   UserModel(
//       {required this.name,
//       required this.email,
//       required this.phone,
//       required this.password});

//   factory UserModel.fromJson(json) {
//     return UserModel(
//         name: json['name'],
//         email: json['email'],
//         phone: json['phone'],
//         password: json['password']);
//   }
// }

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uId;
  final bool isEmailVerified;
  final String image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.isEmailVerified,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uId: json['uId'],
      isEmailVerified: json['isEmailVerified'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
      'image': image,
    };
  }
}
