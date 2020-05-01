import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/User.dart';
import 'package:flutter_test_app/screens/wrapper.dart';
import 'package:flutter_test_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}