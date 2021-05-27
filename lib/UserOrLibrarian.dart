import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/LibraryLogin/LibLogin.dart';
// import 'package:unavu_new/farmer/farmerMainPage.dart';
// import 'package:unavu_new/consumer/consumerMainPage.dart';
// import 'package:unavu_new/consumer/consumerDetail.dart';
// import 'package:unavu_new/farmer/farmer_login.dart';
// import 'package:unavu_new/consumer/consumerRegister.dart';
import 'package:flutter_ecommerce_app/src/UserLogin/welcomePage.dart';

class UserOrLibrarian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.indigo, Colors.tealAccent])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'USER',
                      style: TextStyle(
                          color: Colors.tealAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'QuattrocentoSansB',
                          fontSize: 30),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/user.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LibLogin()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/librarian.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'LIBRARY',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'QuattrocentoSansB',
                          fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
