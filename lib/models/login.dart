import '../models/user.dart';

class Login {
  User signIn(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      User signedInUser = mockUsers.firstWhere(
          (user) => user.email == email && user.password == password);

      return signedInUser;
    }
    return null;
  }
}
