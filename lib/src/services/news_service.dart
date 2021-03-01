import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/config/config.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  

  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    final url = '$urlNews/top-headlines?apiKey=$newsApiKey&country=us';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }
  
}