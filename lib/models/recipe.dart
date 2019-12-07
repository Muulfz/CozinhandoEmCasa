class Recipe {
  String title;
  String photo;
  String portions;
  String prepareTime;
  String ingredients;
  String prepareMethod;

  Recipe(
      {this.title,
        this.photo,
        this.portions,
        this.prepareTime,
        this.ingredients,
        this.prepareMethod});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['titulo'];
    photo = json['foto'];
    portions = json['porcoes'];
    prepareTime = json['tempo_preparo'];
    ingredients = json['ingredientes'];
    prepareMethod = json['modo_preparo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.title;
    data['foto'] = this.photo;
    data['porcoes'] = this.portions;
    data['tempo_preparo'] = this.prepareTime;
    data['ingredientes'] = this.ingredients;
    data['modo_preparo'] = this.prepareMethod;
    return data;
  }
}