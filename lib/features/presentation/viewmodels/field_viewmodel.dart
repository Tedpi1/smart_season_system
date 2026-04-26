import 'package:flutter/material.dart';
import '../../data/models/models.dart';


class DashboardViewModel extends ChangeNotifier {
  bool isLoading = false;

  int total = 0;
  int active = 0;
  int atRisk = 0;
  int completed = 0;

  Future<void> fetchDashboard() async {
    isLoading = true;
    notifyListeners();

    try {
      // 🔥 Replace with your API call
      // final response = await api.getDashboard();

      // TEMP DATA
      total = 24;
      active = 15;
      atRisk = 5;
      completed = 4;

    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  List<DashboardCardModel> get cards => [
    DashboardCardModel(
      title: "Total Fields",
      value: total,
      icon: Icons.agriculture,
      color: Colors.green,
    ),
    DashboardCardModel(
      title: "Active",
      value: active,
      icon: Icons.eco,
      color: Colors.blue,
    ),
    DashboardCardModel(
      title: "At Risk",
      value: atRisk,
      icon: Icons.warning,
      color: Colors.orange,
    ),
    DashboardCardModel(
      title: "Completed",
      value: completed,
      icon: Icons.check_circle,
      color: Colors.purple,
    ),
  ];
}