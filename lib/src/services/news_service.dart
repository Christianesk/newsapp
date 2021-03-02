import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/config/config.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = { };

  

  NewsService(){
    this.getTopHeadlines();

    categories.forEach((cat) {
      this.categoryArticles[cat.name] = new List();
    });
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory(String value){
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get getArticlesBySelectedCategory => this.categoryArticles[this.selectedCategory];

  getTopHeadlines() async{
    final url = '$urlNews/top-headlines?apiKey=$newsApiKey&country=us';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticlesByCategory(String category) async{

    if(this.categoryArticles[category].length > 0) {
      return this.categoryArticles[category];
    }

    final url = '$urlNews/top-headlines?apiKey=$newsApiKey&country=us&category=$category';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.categoryArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }
  
}