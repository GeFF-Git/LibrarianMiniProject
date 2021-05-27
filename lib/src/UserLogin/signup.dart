import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/UserLogin/bezierContainer.dart';
import 'package:flutter_ecommerce_app/src/UserLogin/fotp.dart';
import 'package:flutter_ecommerce_app/src/UserLogin/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

var name, phn, psd, cpsd, loc, plc;

class _SignUpPageState extends State<SignUpPage> {
  final sotp = Random().nextInt(999999);

  TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACcf06289be9297bd618e7b827e0a816c7',
        authToken: '5b812eaca128865541cf5276e1ff37f7',
        twilioNumber: '+17035968826');

    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+91' + phn.toString(),
        messageBody: sotp.toString() +
            ' is your OTP(One time pasword), Dont share it with others with regards Doctors point team.');
  }

  //Name
  Widget _entryName(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryEmail(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  //phone number
  Widget _entryPhonenum(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  phn = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  //password
  Widget _entryPassword(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  psd = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  //conform password
  Widget _entryConPassword(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  cpsd = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  //location
  Widget _entryLocation(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              //use map here
            },
            child: TextField(
                obscureText: isPassword,
                onChanged: (value) {
                  setState(() {
                    loc = value;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
          )
        ],
      ),
    );
  }

  //place
  Widget _entryPlace(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              onChanged: (value) {
                setState(() {
                  plc = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        if (psd == cpsd && psd != null) {
          if (name != null && phn != null && psd != null) {
            sendSms();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserOtp(sotp, phn, "")),
            );
          } else {
            Toast.show("Kindly Fill all the fields\nIts Mandatory", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        } else {
          Toast.show("Password Miss Match", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'LIB',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'RAR',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'IAN',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryName("Name"),
        _entryEmail("Email"),
        _entryPhonenum("Phone Number"),
        _entryPassword("Password", isPassword: true),
        _entryConPassword("Confirm Password", isPassword: true),
        // _entryLocation(
        //     "Location"), //Create a new widget and include google maps
        // _entryPlace("Place"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Value {
  static final getData = [
    {
      'name': name,
      'area': plc,
    }
  ];
}
