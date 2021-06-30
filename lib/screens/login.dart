import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/todo.dart';
import '../controllers/user_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, errorMessage;

  bool saveForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submitForm() async {
    if (saveForm()) {
      try {
        // validation function here

        final result = UserController().signIn(_email, _password);

        if (result != null)
          Navigator.pushReplacementNamed(context, dashboardRoute,
              arguments: mockTodos);

        setState(() {
          errorMessage = "Oops something happen, please try again.";
        });
      } catch (e) {
        setState(() {
          errorMessage = "Invalid email or password";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context, null)),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0.0),
            child: Form(
              key: formKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xff3BCED2),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextFormField(
                      key: new Key('email'),
                      validator: (value) =>
                          value.isEmpty ? 'Email cannot be empty' : null,
                      onSaved: (value) => _email = value.trim(),
                      autocorrect: false,
                      decoration: InputDecoration(
                          errorText: errorMessage,
                          labelText: 'Email',
                          labelStyle: TextStyle(fontFamily: 'OpenSans')),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    child: TextFormField(
                      key: new Key('password'),
                      validator: (value) =>
                          value.isEmpty ? 'Password cannot be empty' : null,
                      onSaved: (value) => _password = value.trim(),
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                          errorText: errorMessage,
                          labelText: 'Password',
                          labelStyle: TextStyle(fontFamily: 'OpenSans')),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff3BCED2),
                        borderRadius: BorderRadius.circular(10)),
                    width: 350,
                    child: TextButton(
                        onPressed: submitForm,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'),
                        )),
                  ),
                ],
              ),
            )));
  }
}
