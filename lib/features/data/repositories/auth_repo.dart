import '../datasources/auth_remote.dart';
import '../models/models.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepository(this.remote);

  Future<UserModel> login(String username, String password) async {
    final data = await remote.login(username, password);
    print("Data $data");
    if (data['username'] != null) {
      return UserModel.fromJson(data);
    } else {
      throw Exception(data['message']);
    }
  }
}