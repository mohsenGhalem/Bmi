import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          iconTheme:const IconThemeData(
            color: Colors.white,

          ),
          textTheme:const TextTheme(
            headline2: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ),

        home: const MyHomePage(title: 'Body Mass Index'),
        );
  }
}
