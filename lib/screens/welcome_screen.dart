import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techijou_app/screens/login.dart';
import 'package:techijou_app/components/RoundedButton.dart';
import 'package:techijou_app/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Techijou',
                    style: GoogleFonts.getFont('Pacifico',
                        textStyle:
                            TextStyle(fontSize: 60, color: Colors.black)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Welcome to Techijou! This is Forum where weebs can write and explore their thoughts!',
                    style: GoogleFonts.getFont('Pacifico',
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.black54)),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: 'Login',
                textsize: 20,
                colour: Colors.black,
                left: 112,
                top: 10,
                right: 112,
                bottom: 10,
                onpress: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RoundedButton(
                text: 'Register',
                textsize: 20,
                colour: Colors.black,
                left: 100,
                top: 10,
                right: 100,
                bottom: 10,
                onpress: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                ),
              ),
            ]),
      ),
    );
  }
}
