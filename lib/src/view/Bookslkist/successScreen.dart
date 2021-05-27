import 'package:flutter/material.dart';

import 'books.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Blocked \nSuccessfully !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Alata',
                      fontSize: 30.0,
                      color: Colors.green,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.white,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(10.0),
                      textColor: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Books('')),
                        );
                        // Respond to button press
                      },
                      icon: Icon(Icons.check_circle_outline, size: 25),
                      label: Text(
                        "Done",
                        style: TextStyle(
                          fontFamily: 'QuattrocentoSansB',
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
