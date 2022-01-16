import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatelessWidget {
  PostWidget({this.caption, this.image, this.username});

  final String? username;
  final String? image;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10,
        top: 0,
        bottom: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color.fromARGB(255, 43, 46, 44),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.white60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    "$username",
                    style: GoogleFonts.getFont(
                      'Oswald',
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 3,
              color: Colors.white70,
            ),
            Image.network(
              image!,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            Divider(
              thickness: 3,
              color: Colors.white70,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                bottom: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$username:$caption',
                  style: GoogleFonts.getFont(
                    'Oswald',
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
