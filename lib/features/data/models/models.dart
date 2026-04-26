import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String username;
  final int role;

  UserModel({
    required this.id,
    required this.username,
    required this.role
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      username: json['username'],
      role: json['role']
    );
  }
}

//dsboard model
class DashboardCardModel {
  final String title;
  final int value;
  final IconData icon;
  final Color color;

  DashboardCardModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}