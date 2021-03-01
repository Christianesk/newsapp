import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
  //
    return Scaffold(
      body: (headlines.length == 0)
      ? Center(child: CircularProgressIndicator())
      :NewsList(headlines)
    );
  }
}