// import 'package:hive/hive.dart';

// @HiveType(typeId: 0)
// class UserModel {
//   @HiveField(0)
//   final String accessToken;

//   @HiveField(1)
//   final String refreshToken;

//   @HiveField(2)
//   final int id;

//   @HiveField(3)
//   final String username;

//   @HiveField(4)
//   final String email;

//   @HiveField(5)
//   final String firstName;

//   @HiveField(6)
//   final String lastName;

//   @HiveField(7)
//   final String gender;

//   @HiveField(8)
//   final String image;

//   @HiveField(9)
//   final bool isLoggedin;

//   @HiveField(10)
//   List<int> favoriteProductIds;

class UserModel {
  final String accessToken;
  final String refreshToken;
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  bool? isLoggedin;
  List<int>? favorites;

  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    this.isLoggedin,
    this.favorites,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      accessToken: data["accessToken"],
      refreshToken: data["refreshToken"],
      id: data["id"],
      username: data["username"],
      email: data["email"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      gender: data["gender"],
      image: data["image"],
      isLoggedin: data["isLoggedin"],
      favorites: data['favorites'] != null ? List<int>.from(data['favorites']) : [],
    );
  }
}
