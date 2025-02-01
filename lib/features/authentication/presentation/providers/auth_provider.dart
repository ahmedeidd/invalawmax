import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/authenticate_user.dart';

class AuthProvider with ChangeNotifier {
  final AuthenticateUser _authenticateUser;
  User? _user;
  bool _isLoading = false;
  String? _error;

  AuthProvider(this._authenticateUser);

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get accessToken => _user?.accessToken;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _user = await _authenticateUser.execute(username, password);
      _error = null;
    } catch (e) {
      _error = e.toString();
      _user = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
