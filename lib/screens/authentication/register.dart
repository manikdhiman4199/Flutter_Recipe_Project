import 'package:flutter/material.dart';
import 'package:flutter_test_app/services/auth.dart';
import 'package:flutter_test_app/shared/constants.dart';
import 'package:flutter_test_app/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email='', password='', error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1536510344784-b43e97721c1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
          fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0,
          title: Text('Register', style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            FlatButton.icon(onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person, color: Colors.white,), 
            label: Text('Sign in', style: TextStyle(color: Colors.white),))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration : textInputDecoration.copyWith(hintText: 'Email', hintStyle: TextStyle(color: Colors.black,)),
                  validator: (val) => val.isEmpty ? 'Email not valid' : null ,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password', hintStyle: TextStyle(color: Colors.black,)),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                 color: Colors.blue[900],
                child: Text('Register',
                style: TextStyle(color: Colors.white, fontSize: 15.0)
                ,)
                ,),
                SizedBox(height: 20.0,),
                Text(error,
                style: TextStyle(color: Colors.red),)
              ],
            ))
        ),
      ),
    );
  }
}