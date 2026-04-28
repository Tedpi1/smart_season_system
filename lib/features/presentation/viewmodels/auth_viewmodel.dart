import 'package:flutter/material.dart';
import '../../data/repositories/auth_repo.dart';


enum LoginState { idle, loading, success, error }

class LoginViewModel extends ChangeNotifier {
  final AuthRepository repository;

  LoginViewModel(this.repository);

  bool _isLoading = false;
  String? _error;
  String? _username;
  LoginState _state = LoginState.idle;
  int? _role;
  int? _userId;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get username => _username;
  int? get role=>_role;
  int? get userId=>_userId;

  LoginState get state => _state;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _state = LoginState.loading;
    _error = null;
    notifyListeners();

    try {
      final result = await repository.login(username, password);
      _username = result.username;
      _role=result.role;
      _userId=result.id;

      _state = LoginState.success;
    } catch (e) {
      _error = e.toString();
      _state = LoginState.error;
    }

    _isLoading = false;
    notifyListeners();
  }
}