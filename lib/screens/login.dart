import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techijou_app/components/RoundedButton.dart';
import 'package:techijou_app/screens/homeset.dart';
import 'package:techijou_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  double get size => MediaQuery.of(context).size.height;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
          height: size,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 112, 225, 245),
              Color.fromARGB(255, 255, 209, 148)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 290, 10),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle),
                      child: InkResponse(
                        radius: 25,
                        highlightColor: Colors.teal.shade300,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset('images/icon.png'),
                      height: 150,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'Login',
                      style: GoogleFonts.getFont('Pacifico',
                          textStyle:
                              TextStyle(fontSize: 60, color: Colors.black),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextField(
                    obscureText: false,
                    onChanged: (value) {
                      email = value;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration:
                        ktextfield.copyWith(hintText: "Enter your email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration:
                        ktextfield.copyWith(hintText: "Enter your password"),
                  ),
                ),
                RoundedButton(
                    colour: Colors.black,
                    left: 80,
                    top: 10,
                    right: 80,
                    bottom: 10,
                    text: 'Login',
                    textsize: 24,
                    onpress: () {
                      signIn(email, password);
                    }),
              ])),
    ));
  }

  void signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homeset()),
            ))
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
