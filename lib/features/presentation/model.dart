//dsboard model
import 'package:flutter/material.dart';

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
class PieSlice {
  final String label;
  final double value;
  final Color color;

  PieSlice({
    required this.label,
    required this.value,
    required this.color,
  });
}