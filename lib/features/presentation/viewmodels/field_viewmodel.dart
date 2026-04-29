import 'package:flutter/material.dart';
import '../../data/models/models.dart';
import '../../data/repositories/field_repo.dart';
import '../models/dashboar_cards.dart';


class DashboardViewModel extends ChangeNotifier {
  final FieldRepo repo;

  DashboardViewModel(this.repo);

  bool isLoading = false;

  int total = 0;
  int active = 0;
  int atRisk = 0;
  int completed = 0;
  int count=0;
  double percentage=0.0;
  List<AssignField> fields = [];
  List<UserFields>  userfield=[];

  Future<void> fetchDashboard(int userId, int role) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await repo.getDashboardStats(userId, role);

      final piedata= await repo.PieData(userId, role);

      final tableData=await repo.fieldRepos();
      final field= await repo.agentField(userId);
      total = data.totalFields;
      active = data.healthyAndProgressing;
      atRisk = data.needsAttention;
      completed = data.harvested;
      count=piedata.count;
      percentage=piedata.percentage;

      fields = tableData;
      userfield=field;

    } catch (e) {
      print("Dashboard errors: $e");
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

  List<PieSlice> get pieData => [
    PieSlice(
      label: "Active",
      value: active.toDouble(),
      color: Colors.blue,
    ),
    PieSlice(
      label: "At Risk",
      value: atRisk.toDouble(),
      color: Colors.orange,
    ),
    PieSlice(
      label: "Completed",
      value: completed.toDouble(),
      color: Colors.purple,
    ),
  ];

}