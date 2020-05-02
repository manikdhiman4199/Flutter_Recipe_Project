import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/recipe.dart';
import 'package:flutter_test_app/screens/home/recipeTile.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {

  @override
  Widget build(BuildContext context) {

    
  final recipes = Provider.of<List<Recipe>>(context);
  
  return ListView.builder(
    itemCount: recipes.length,
    itemBuilder: (context, index) {
      return RecipeTile(currentRecipe: recipes[index]);
    });
  }
}   