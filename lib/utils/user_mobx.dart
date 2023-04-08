import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

class UserMobX {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserMobX() {
    setUser = Action((User? newUser) => _setUser(newUser));
  }
  final Observable _user = Observable(null);
  User get user => _user.value;

  late Action setUser;

  void _setUser(User? newUser) {
    _user.value = newUser;
  }
}
