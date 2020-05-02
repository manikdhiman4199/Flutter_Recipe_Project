import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/recipe.dart';

class RecipeTile extends StatelessWidget {

  final Recipe currentRecipe;
  RecipeTile({this.currentRecipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 10.0),
      child: Card(
        margin: EdgeInsetsDirectional.fromSTEB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: () {
            showDialog(
            context: context,
            builder: (BuildContext context) { return AlertDialog(
              title: Text('Add to favorties ?'),
              content: Text('Do you want to add this recipe to your favorites ?'),
              actions: <Widget>[
                FlatButton.icon(onPressed: () {}, icon: Icon(Icons.favorite), label: Text('Yes')),
                FlatButton.icon(onPressed: () {},icon: Icon(Icons.remove_circle_outline), label: Text('No')),
              ],
            );}
            );},
          title: Text(currentRecipe.title),
          subtitle: Text(currentRecipe.procedure),
        ),
      ),
    );
  }
}