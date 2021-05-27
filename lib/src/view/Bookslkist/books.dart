import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/Library%20data/data.dart';
import 'package:flutter_ecommerce_app/src/view/Bookslkist/Users.dart';
import 'package:flutter_ecommerce_app/values.dart';
import 'package:http/http.dart' as http;

import 'Users.dart';
import 'availablePage.dart';

var libName;
var indexVal;

class Books extends StatelessWidget {
  Books(libname) {
    libName = libname;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Customer(),
    );
  }
}

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  var lib = Library.getData;
  var email = mockUsers[0]['email'];

  void LibraryMail(String book) async {
    final String url = 'https://mt-intern.herokuapp.com/geffyorder';

    Map<String, dynamic> data = <String, dynamic>{
      'colname': libName,
      'bname': book,
      'mailid': mailId,
    };

    print(book);

    http.Response response = await http.post(Uri.parse(url), body: data);

    if (response.statusCode == 200) {
      String data = response.body;

      if (data == 'Success') {
        print('Fine');
      } else {
        print("error");
        print("Error " + data);
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.filter_list,
              ),
              onPressed: () {},
            ),
          ],
          title: Text(
            'Books',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'QuattrocentoSans',
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              width: 310,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Search here",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontFamily: 'OpenSans'),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: lib.length,
                        itemBuilder: (context, index) {
                          var num = index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                indexVal = index;
                                (int.tryParse(lib[index]['count']) ?? 0) == 0
                                    ? _showMyDialog()
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AvailablePage(num)));
                                // Second second = new Second(
                                //   food[index]['id'],
                                // );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => second),
                                // );

                                // Navigator.push(
                                // context,
                                //MaterialPageRoute(
                                //  builder: (context) => select),
                                //);
                              },
                              child: Card(
                                color: Color(lib[index]['color']),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),

                                      // CircleAvatar(
                                      //   radius: 30.0,
                                      //   backgroundImage:
                                      //       AssetImage(food[index]['photo']),
                                      // ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              lib[index]['name'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Alata',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                margin: EdgeInsets.all(10),
                                elevation:
                                    5.0, // this field changes the shadow of the card 1.0 is default
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Availability Check'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Sorry!!! , The Book Is UnAvailable'),
                Text("You'll be notified when the book is available"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                mail = email;
                Navigator.of(context).pop();
                LibraryMail(lib[indexVal]['name']);
              },
            ),
          ],
        );
      },
    );
  }

  showAlertDialog(BuildContext context, Map<String, dynamic> map) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.popUntil(context, (route) => false);
        // Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Books(libName)));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Availability Check"),
      content: Text("Sorry!!! , The Book Is UnAvailable"),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Books(libName)));
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
