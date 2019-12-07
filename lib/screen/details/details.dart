import 'package:cozinhando_em_casa/models/recipe.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Recipe recipe;

  const Details({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDetails();
  }

  Widget _buildDetails() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildDetailImage(recipe.photo),
          _buildTitleDetails(recipe.title),
          _buildDetailIcons('${recipe.portions} porcoes', recipe.prepareTime),
          _buildDetailsSubtitle('Ingredientes'),
          _buildDetailsText(recipe.ingredients),
          _buildDetailsSubtitle('Modo de preparo'),
          _buildDetailsText(recipe.prepareMethod)
        ],
      ),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildDetailImage(image) {
    return Image.asset(image);
  }

  Widget _buildTitleDetails(title) {
    return Center(
      child: Text(title,
          style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
    );
  }

  Widget _buildDetailIcons(yield, prepareTime) {
    return Row(
      children: <Widget>[
        _buildDetailColumIcon(Icons.restaurant, yield),
        _buildDetailColumIcon(Icons.timer, prepareTime)
      ],
    );
  }

  Widget _buildDetailColumIcon(icon, text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.deepOrange),
          Text(text,
              style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _buildDetailsSubtitle(subtitle) {
    return Center(
      child: Text(subtitle, style: TextStyle(fontSize: 20)),
    );
  }
  Widget _buildDetailsText(text) {
    return Container(
      child: Text(text),
      padding: EdgeInsets.all(16),
    );
  }
  Widget _buildAppBar() {
    return AppBar(
      title: Text('Cozinhando em Casa'),
    );
  }
}
