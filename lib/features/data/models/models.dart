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

class FieldModel {
  final int id;
  final String name;
  final String cropType;
  final String plantingDate;
  final int stage;
  final String? notes;
  final int? assignedTo;
  final String updatedAt;

  FieldModel({
    required this.id,
    required this.name,
    required this.cropType,
    required this.plantingDate,
    required this.stage,
    this.notes,
    this.assignedTo,
    required this.updatedAt,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      name: json['name'],
      cropType: json['crop_type'],
      plantingDate: json['planting_date'],
      stage: json['stage'],
      notes: json['notes'],
      assignedTo: json['assigned_to'],
      updatedAt: json['updated_at'],
    );
  }
}

class FieldDashboardModel {
  final int healthyAndProgressing;
  final int needsAttention;
  final int harvested;
  final int totalFields;

  FieldDashboardModel({
    required this.healthyAndProgressing,
    required this.needsAttention,
    required this.harvested,
    required this.totalFields,
  });

  factory FieldDashboardModel.fromJson(Map<String, dynamic> json) {
    return FieldDashboardModel(
      healthyAndProgressing: json['healthy_and_progressing'],
      needsAttention: json['needs_attention'],
      harvested: json['harvested'],
      totalFields: json['total_fields'],
    );
  }
}
class FieldStatusItem {
  final int count;
  final double percentage;

  FieldStatusItem({
    required this.count,
    required this.percentage,
  });

  factory FieldStatusItem.fromJson(Map<String, dynamic> json) {
    return FieldStatusItem(
      count: json['count'] ?? 0,
      percentage: (json['percentage'] ?? 0).toDouble(),
    );
  }
}

class AssignField {
  final String field_name;
  final String crop_type;
  final String stage;
  final String agent;


  AssignField({
    required this.field_name,
    required this.crop_type,
    required this.stage,
    required this.agent
  });

  factory AssignField.fromJson(Map<String, dynamic> json) {
    return AssignField(
      field_name: json['field_name'] ?? 0,
      crop_type: json['crop_type'],
      stage: json['stage'],
      agent: json['username']
    );
  }
}
