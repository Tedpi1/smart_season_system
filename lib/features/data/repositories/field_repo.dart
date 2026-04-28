import '../datasources/field_remote.dart';
import '../models/models.dart';


class FieldRepo {
  final FieldRemoteSource remote;

  FieldRepo(this.remote);

  Future<FieldDashboardModel> getDashboardStats(int userId, int role) async {
    final data = await remote.fetchDashboardStats(userId, role);

    return FieldDashboardModel.fromJson(data);
  }
  Future<FieldStatusItem> PieData(int userId, int role) async {
    final data = await remote.fetchPie(userId, role);

    return FieldStatusItem.fromJson(data);
  }

  Future<AssignField> FieldRepos() async{
    final data= await remote.fetchAssignedFields();
    return AssignField.fromJson(data);
  }
}