import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_app/models/recipe.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference todoCollection = Firestore.instance.collection('todoCollection');
  final CollectionReference recipeCollection = Firestore.instance.collection('recipeCollection');

  Future getRecipes() async {
    print(recipeCollection.document().snapshots());
  }

  List<Recipe> _recipeListFromSnapshot(QuerySnapshot snapshot) {

    return snapshot.documents.map((recipe) {
      return Recipe(
        title: recipe.data['title'], 
        duration: recipe.data['duration'],
        procedure: recipe.data['procedure']
      );
    }).toList();

  }

  Stream<List<Recipe>> get recipe {
    return recipeCollection.snapshots().map(_recipeListFromSnapshot);
  }

  Future updateUserData(String title, String task) async {

    return await todoCollection.document(uid).setData({
      'title' : title,
       'task' : task
    });
  }

}