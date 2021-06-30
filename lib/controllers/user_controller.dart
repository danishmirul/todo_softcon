import 'package:project_1/models/user.dart';

class UserController {
  User currentUser;


  User signIn(String email, String password){

    if(email.isNotEmpty && password.isNotEmpty){
      currentUser = 
        mockUsers.firstWhere((user) => user.email == email && user.password == password);

      return currentUser;
    }

    return null;
  }
}