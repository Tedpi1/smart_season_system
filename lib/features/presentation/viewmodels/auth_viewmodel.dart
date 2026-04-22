import 'package:flutter/material.dart';
import '../../data/repositories/auth_repo.dart';


class LoginViewModel extends ChangeNotifier {
  final AuthRepository repository;

  LoginViewModel(this.repository);

  bool _isLoading = false;
  String? _error;
  String? _username;

  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get username => _username;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await repository.login(username, password);
      _username = result.username;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}