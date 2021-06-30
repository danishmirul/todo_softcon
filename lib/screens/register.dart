import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static String _email;
  static String _password;
  static String _confirm;

  bool _autoValidate = false;
  bool _absorber = false;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  

  _validateInputs() async{
    // if (_formKey.currentState.validate()) {
    //   _formKey.currentState.save();
    //   try {
    //     FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _email, password: _password)).user;
    //     Navigator.pushReplacementNamed(context, '/firstScreen');
    //   }
    //   catch (e) {
    //     print('Error: $e');
    //   }
    // }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be blank';
    } else if (value.length < 6)
      return 'Password must be 6 characters or more';
    else
      return null;
  }

  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be blank';
    } else if (value.length < 6)
      return 'Password must be 6 characters or more';
    else
      return null;
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
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: Text(
                  'Registration',
                  style: TextStyle(
                    color:  Color(0xff3BCED2),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 22
                  ),
                ), 
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: TextFormField(
                  key: new Key('email'),
                  validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
                  onSaved: (String val) {
                    setState(() {
                      _email = val;
                    });
                  },
                  autocorrect: false,
                  decoration: InputDecoration(
                      //errorText: errorMessage,
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontFamily: 'OpenSans')),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: TextFormField(
                  key: new Key('password'),
                  validator: validatePassword,
                  obscureText: true,
                  onSaved: (String val) {
                    setState(() {
                      _password = val;
                    });
                  },
                  autocorrect: false,
                  decoration: InputDecoration(
                      //errorText: errorMessage,
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(fontFamily: 'OpenSans')),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: TextFormField(
                  key: new Key('confirm_password'),
                  validator: (value) => value.isEmpty ? 'Confirm Password cannot be empty' : null,
                  obscureText: true,
                  onSaved: (String val) {
                    setState(() {
                      _confirm = val;
                    });
                  },
                  autocorrect: false,
                  decoration: InputDecoration(
                      //errorText: errorMessage,
                      labelText: 'Confirm Password',
                      labelStyle:
                          TextStyle(fontFamily: 'OpenSans')),
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
                    onPressed: _validateInputs,
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'
                      ),
                    )
                ),
              ),
          ],),
        )
      )
    );
  }
}