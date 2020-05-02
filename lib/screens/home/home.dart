import 'package:flutter_test_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/home/recipeList.dart';
import 'package:flutter_test_app/services/auth.dart';
import 'package:flutter_test_app/services/database.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider < List < Recipe >> .value(
      value: DatabaseService().recipe,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Test Application'),
            backgroundColor: Colors.blue[900],
            elevation: 0.0,
            actions: < Widget > [
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person, color: Colors.white, ),
                label: Text('Log out', style: TextStyle(color: Colors.white), ))
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.favorite),)
              ]),
          ),
          backgroundColor: Colors.brown[100],
          
          body: TabBarView(
            children: [
              RecipeList(),
              RecipeList(),
            ]),
        ),
      ),
    );
  }
}