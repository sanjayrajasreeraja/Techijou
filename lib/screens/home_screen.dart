import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techijou_app/components/PostWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference ref = FirebaseFirestore.instance.collection('post');

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              bottom: false,
              child: Container(
                height: 110,
                child: Row(
                  children: <Widget>[
                    Hero(tag: "logo", child: Image.asset('images/icon.png')),
                    Text(
                      'Home',
                      style: GoogleFonts.getFont(
                        'Pacifico',
                        textStyle: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: ref.snapshots(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount:
                            (snapshot.data! as QuerySnapshot).docs.length,
                        itemBuilder: (listviewContext, index) {
                          var doc =
                              (snapshot.data! as QuerySnapshot).docs[index];
                          return PostWidget(
                            caption: doc['caption'],
                            image: doc['image'],
                            username: doc['username'],
                          );
                        },
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
