import 'package:flutter/material.dart';

InputDecoration ktextfield = InputDecoration(
    hintText: "",
    hintStyle: TextStyle(color: Colors.black),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.black,
        width: 3,
      ),
    ),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.black,
          width: 3,
        )),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.black,
        width: 3,
      ),
    ));
