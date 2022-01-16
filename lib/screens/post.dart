import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techijou_app/components/RoundedButton.dart';
import 'package:techijou_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techijou_app/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techijou_app/user_reg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  double get size => MediaQuery.of(context).size.height;
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final fieldText = TextEditingController();
  final fieldText1 = TextEditingController();
  UserModal loggedInUser = UserModal();
  String image = "";
  String caption = "";

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
                          'Post',
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
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Upload Post',
                    style: GoogleFonts.getFont(
                      'Oswald',
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: fieldText,
                  obscureText: false,
                  onChanged: (value) {
                    image = value;
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration:
                      ktextfield.copyWith(hintText: "Enter your image's url"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 30,
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  maxLines: 2,
                  controller: fieldText1,
                  obscureText: false,
                  onChanged: (value) {
                    caption = value;
                  },
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration:
                      ktextfield.copyWith(hintText: "Enter your caption"),
                ),
              ),
              RoundedButton(
                colourbg: Colors.black,
                colour: Colors.white,
                left: 80,
                top: 10,
                right: 80,
                bottom: 10,
                text: "Post",
                textsize: 24,
                onpress: () {
                  if (image.startsWith("https://") &&
                      image.endsWith(".png") &&
                      caption != "") {
                    postPostDetailsToFirestore();
                  } else if (image.startsWith("https://") &&
                      image.endsWith(".jpeg") &&
                      caption != "") {
                    postPostDetailsToFirestore();
                  } else if (image.startsWith("https://") &&
                      image.endsWith(".gif") &&
                      caption != "") {
                    postPostDetailsToFirestore();
                  } else if (image.startsWith("https://") &&
                      image.endsWith(".jpg") &&
                      caption != "") {
                    postPostDetailsToFirestore();
                  } else {
                    Fluttertoast.showToast(
                      msg:
                          "Make sure the url STARTS WITH htttps:// and ends with .png/.jpeg/.gif/.jpg or Enter a caption",
                    );
                  }

                  setState(() {
                    fieldText.clear();
                    fieldText1.clear();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void username() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModal.fromMap(value.data());
      setState(() {});
    });
  }

  postPostDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    username();
    PostModal postModal = PostModal();

    postModal.image = image;
    postModal.caption = caption;
    postModal.username = loggedInUser.username;

    await firebaseFirestore.collection("post").add(postModal.toMap());
  }
}
