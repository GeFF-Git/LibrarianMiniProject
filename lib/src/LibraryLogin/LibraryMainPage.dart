import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/Library%20data/data.dart';
import 'package:flutter_ecommerce_app/src/view/Bookslkist/Users.dart';
import 'package:flutter_ecommerce_app/values.dart';

import 'LibrarySecondPage.dart';

class LibraryMainPage extends StatelessWidget {
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LibrarySecondPage(num)));
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
                Navigator.of(context).pop();
                mail = email;
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
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Books()));
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
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Books()));
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
