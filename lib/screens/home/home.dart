import 'package:flutter/material.dart';
import 'package:flutter_test_app/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Application'),
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        actions: < Widget > [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Log out'))
        ],
      ),
      backgroundColor: Colors.brown[100],
    );
  }
}