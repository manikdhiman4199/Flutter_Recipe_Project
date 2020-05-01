import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/services/auth.dart';
import 'package:flutter_test_app/shared/constants.dart';
import 'package:flutter_test_app/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth =  AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email ='', password = '', error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpeg'),
          fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.brown[500],
          elevation: 0,
          title: Text('Sign In'),
          actions: <Widget>[
            FlatButton.icon(onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person_add), 
            label: Text('Register'))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Email cannot be empty' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) => val.length < 6 ? 'Password must be greater than 6 characters' : null,
                  onChanged: (val) {
                    password = val;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 30.0,),
                FlatButton(onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic res = await _auth.signInWithEmailandPassword(email, password);
                    if(res == null ) {
                      setState(() {
                        loading = false;
                        error = 'User not found';
                      });
                    }
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                color: Colors.blue[900],
                child: Text('Sign In',
                style: TextStyle(color: Colors.white, fontSize: 15.0)
                ,)
                ,),
                SizedBox(height: 20.0),
                Text(error, style: TextStyle(color: Colors.red),),
              ],
            ))
        ),
      ),
    );
  }
}