import 'package:flutter/material.dart';
import 'router.dart';

import 'constants.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Softcon',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: homeRoute,
        onGenerateRoute: createRoute,
      ),
    );
