import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/config/config.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async{
    final url = '$URL_NEWS/top-headlines?apiKey=$NEWS_API_KEY&country=us';

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson( resp.body);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }
  
}