import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void updateEmailAddress(String email) {
    _email = email;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    notifyListeners();
  }
}
