import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';



class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          _ListCategories(),
          Expanded(
            child: NewsList(newsService.getArticlesBySelectedCategory),
          )
        ],
      )
    );
  }
}

class _ListCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 105,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final cName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  _CategoryButton(category: categories[index]),
                  SizedBox(height: 5),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final Category category;

  const _CategoryButton({this.category});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context,);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context,listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color:  (newsService.selectedCategory == this.category.name)?myTheme.accentColor:Colors.black54
        ),
      ),
    );
  }
}