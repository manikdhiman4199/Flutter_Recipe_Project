import 'package:flutter/material.dart';


const textInputDecoration = InputDecoration(
  errorStyle: TextStyle(
    color: Colors.white
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red
    )
  ),
  filled: true,
  fillColor: Colors.white70,
  enabled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0
    ),
  )
);