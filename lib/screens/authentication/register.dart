import 'package:flutter/material.dart';
import 'package:flutter_test_app/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email='', password='', error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        elevation: 0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {
            widget.toggleView();
          }, 
          icon: Icon(Icons.person_outline), 
          label: Text('Sign in'))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Email not valid' : null ,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                
              ),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Password is too short' : null ,
                onChanged: (val) {
                  password = val;
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(onPressed: () async {
                if(_formKey.currentState.validate()) {
                  dynamic res = await _auth.registerWithEmailandPassword(email, password);
                  print(res);
                  if(res == null) {
                    setState(() {
                      error = 'Email is not valid';
                    });
                  }
                }
              },
              color: Colors.black,
              child: Text('Register',
              style: TextStyle(color: Colors.white)
              ,)
              ,),
              SizedBox(height: 20.0,),
              Text(error,
              style: TextStyle(color: Colors.red),)
            ],
          ))
      ),
    );
  }
}