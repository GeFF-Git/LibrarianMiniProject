import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/Library%20data/data.dart';
import 'package:flutter_ecommerce_app/src/view/Bookslkist/Users.dart';
import 'package:http/http.dart' as http;

import 'successScreen.dart';

var index;

class AvailablePage extends StatefulWidget {
  AvailablePage(num) {
    index = num;
  }

  @override
  _AvailablePageState createState() => _AvailablePageState();
}

class _AvailablePageState extends State<AvailablePage> {
  var lib = Library.getData;
  void sendMail(String bookName) async {
    final String url = 'https://mt-intern.herokuapp.com/geffybooked';

    Map<String, dynamic> data = <String, dynamic>{
      'bname': bookName,
      'mail': mailId,
      // 'subject': "This",
    };

    http.Response response = await http.post(Uri.parse(url), body: data);

    if (response.statusCode == 200) {
      String data = response.body;
      if (data == 'mail sent') {
        print('Mail Sent');
      } else {
        print('Error ' + data);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
        appBar: AppBar(
          centerTitle: true,
          elevation: 20,
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
          title: Text(
            'About',
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    // CircleAvatar(
                    //   radius: 80.0,
                    //   backgroundImage: AssetImage(doctor[id]['photo']),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      lib[index]['name'],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontFamily: 'Alata',
                      ),
                    ),
                    // Text(
                    //   'hio',
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.pinkAccent,
                    //     fontFamily: 'Raleway',
                    //     letterSpacing: 2.5,
                    //   ),
                    // ),
                    SizedBox(
                      height: 30.0,
                      width: 150.0,
                      child: Divider(
                        color: Colors.black12,
                        thickness: 1.0,
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "About Book",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'RobotoBold',
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, left: 10.0),
                            child: Text(
                              lib[index]['about'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'RobotoLight',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                    // Card(
                    //   color: Colors.white,
                    //   elevation: 15.0,
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     leading: Icon(
                    //       Icons.place,
                    //       color: Colors.redAccent,
                    //       size: 28.0,
                    //     ),
                    //     title: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[],
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   color: Colors.white,
                    //   elevation: 15.0,
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     leading: Icon(
                    //       Icons.email,
                    //       color: Colors.redAccent,
                    //       size: 28.0,
                    //     ),
                    //     title: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         // Text(
                    //         //   'hello',
                    //         //   style: TextStyle(
                    //         //     fontFamily: 'RobotoLight',
                    //         //     fontWeight: FontWeight.w300,
                    //         //     fontSize: 16.0,
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   color: Colors.white,
                    //   elevation: 15.0,
                    //   margin: EdgeInsets.symmetric(
                    //       vertical: 10.0, horizontal: 25.0),
                    //   child: ListTile(
                    //     leading: Icon(
                    //       Icons.access_time,
                    //       color: Colors.redAccent,
                    //       size: 28.0,
                    //     ),
                    //     title: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         // Text(
                    //         //   'Working Hours: ',
                    //         //   style: TextStyle(
                    //         //     fontWeight: FontWeight.bold,
                    //         //     fontFamily: 'RobotoBold',
                    //         //     fontSize: 18.0,
                    //         //   ),
                    //         // ),
                    //         // Text(
                    //         //   'mk',
                    //         //   style: TextStyle(
                    //         //     fontFamily: 'RobotoLight',
                    //         //     fontWeight: FontWeight.w300,
                    //         //     fontSize: 16.0,
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20.0,
                    // ),
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
                          sendMail(lib[index]['name']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessScreen()),
                          );
                          // Respond to button press
                        },
                        icon: Icon(Icons.check_circle_outline, size: 25),
                        label: Text(
                          "Block",
                          style: TextStyle(
                            fontFamily: 'QuattrocentoSansB',
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
