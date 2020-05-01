import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/User.dart';
import 'package:flutter_test_app/screens/authentication/authenticate.dart';
import 'package:flutter_test_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
      //To return either Home or Auth Widget
      return user != null ? Home() : Authenticate();
  }
}