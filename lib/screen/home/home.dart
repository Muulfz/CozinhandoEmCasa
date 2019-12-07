import 'dart:convert';

import 'package:cozinhando_em_casa/models/recipe.dart';
import 'package:cozinhando_em_casa/screen/details/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}


class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _buildHome();
  }

  Widget _buildHome() {
    return Scaffold(
      body: _buildCardList(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildCardList() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> recipes = json.decode(snapshot.data.toString());

        return ListView.builder(itemBuilder: (BuildContext context, int index) {
          Recipe recipe = Recipe.fromJson(recipes[index]);
          return _buildCard(recipe);
        }, itemCount: recipes == null ? 0 : recipes.length);
      },
    );
  }

  Widget _buildCard(recipe) {

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Details(recipe: recipe,)
        ));
      },
      child: SizedBox(
        height: 300,
        child: Card(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[_buildImage(recipe.photo), _buildGradientCard(), _buildCardText(recipe.title)],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardText(title) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white
        ),
      ),
    );
  }

  Widget _buildGradientCard() {
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7)
          ]
        )
      ),
    );
  }

  Widget _buildImage(photo) {
    return Image.asset(
      photo,
      fit: BoxFit.cover,
      height: 268,
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }

}