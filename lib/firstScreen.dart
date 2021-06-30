import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(32.0, 0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Text(
                'TODO SOFTCON',
                style: TextStyle(
                  color:  Color(0xff3BCED2),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 22
                ),
              ),
            ),
            SizedBox(
                height: 380.0,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff3BCED2), width: 2.0),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: 350,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff3BCED2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 350,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans'
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              ),
        ],),
      )
    );
  }
}