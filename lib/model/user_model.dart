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
    );
  }
}
