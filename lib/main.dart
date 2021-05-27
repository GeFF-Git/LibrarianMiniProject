import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UserOrLibrarian.dart';

void main() {
  runApp(EcommApp());
}

class EcommApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LIBRARIAN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserOrLibrarian(),
    );
  }
}
