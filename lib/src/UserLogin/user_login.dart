import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/UserLogin/welcomePage.dart';

void main() => runApp(User_Login());

class User_Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIBRARIAN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
