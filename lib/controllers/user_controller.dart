import '../models/user.dart';

class UserController {
  User currentUser;

  User signIn(String email, String password) {
    return currentUser = User().signIn(email, password);
  }

  void signOut() {
    currentUser = null;
  }
}
