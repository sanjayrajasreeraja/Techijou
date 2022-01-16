import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techijou_app/components/RoundedButton.dart';
import 'package:techijou_app/screens/welcome_screen.dart';
import 'package:techijou_app/constant.dart';
import 'package:techijou_app/user_reg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  double get size => MediaQuery.of(context).size.height;
  User? user = FirebaseAuth.instance.currentUser;
  UserModal loggedInUser = UserModal();
  String newusername = "";

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModal.fromMap(value.data());
      setState(() {});
    });
  }

  void username() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModal.fromMap(value.data());
      setState(() {
        loggedInUser.username;
      });
    });
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 60.0,
                  ),
                  child: Container(
                    height: 110,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        Image.asset('images/icon.png'),
                        Positioned(
                          top: 22,
                          left: 110,
                          child: Text(
                            'Profile',
                            style: GoogleFonts.getFont('Pacifico',
                                textStyle: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Hello There ${loggedInUser.username}',
                  style: GoogleFonts.getFont('Oswald',
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      )),
                ),
              ),
              Center(
                child: Text(
                  'Update Your Username',
                  style: GoogleFonts.getFont('Oswald',
                      textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  obscureText: false,
                  onChanged: (value) {
                    newusername = value;
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration:
                      ktextfield.copyWith(hintText: "Enter your new username"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                colour: Colors.black,
                left: 60,
                top: 10,
                right: 60,
                bottom: 10,
                text: 'Update Username',
                textsize: 20,
                onpress: () {
                  updateDetailsToFirestore();
                  username();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  color: Colors.black87,
                  thickness: 2,
                ),
              ),
              RoundedButton(
                colour: Colors.black,
                left: 30,
                top: 5,
                right: 30,
                bottom: 5,
                text: 'Sign out',
                textsize: 20,
                onpress: () => logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  updateDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModal userModal = UserModal();

    userModal.email = user!.email;
    userModal.uid = user.uid;
    userModal.username = newusername;

    if (newusername != "") {
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .update(userModal.toMap())
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
      ;
    } else {
      Fluttertoast.showToast(msg: "Fucking idiot username cant be null");
    }
  }
}
