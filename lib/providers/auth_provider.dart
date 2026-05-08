import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  User _user = const User(
    id: '',
    name: '',
    email: '',
    phone: '',
    address: '',
  );

  User get user => _user;

  bool get isLoggedIn => _user.isAuthenticated;

  void login(String email, String password) {
    _user = User(
      id: 'u1',
      name: 'Ayesha Khan',
      email: email,
      phone: '+92 300 1234567',
      address: 'F-10 Markaz, Islamabad',
      avatarUrl: '',
    );
    notifyListeners();
  }

  void signup(String name, String email, String phone, String password) {
    _user = User(
      id: 'u${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
      address: '',
      avatarUrl: '',
    );
    notifyListeners();
  }

  void logout() {
    _user = const User(
      id: '',
      name: '',
      email: '',
      phone: '',
      address: '',
    );
    notifyListeners();
  }
}
