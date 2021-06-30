class User {
  String email;
  String password;

  User({this.email, this.password});

  User signIn(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      User signedInUser = mockUsers.firstWhere(
          (user) => user.email == email && user.password == password);
      return signedInUser;
    }
    return null;
  }
}

List mockUsers = [
  User(email: 'test@gmail.com', password: 'abcd1234'),
  User(email: 'boukendabouken@genshin.mihoyo.com', password: 'fischl4lyfe'),
];
