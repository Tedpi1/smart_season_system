class UserModel {
  final int id;
  final String username;

  UserModel({required this.id, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      username: json['username'],
    );
  }
}