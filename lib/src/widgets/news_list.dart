import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _NewItem(article: this.news[index],index: index,);
      },
    );
  }
}

class _NewItem extends StatelessWidget {
  final Article article;
  final int index;

  const _NewItem({
    @required this.article, 
    @required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(article: article,index: index),
        _TitleCard(article: article),
        _ImageCard(article: article),
        _BodyCard(article: article),
        _ButtonCard(),
        SizedBox(height: 10),
        Divider()
      ],
    );
  }
}

class _ButtonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {

  final Article article;

  const _BodyCard({
    @required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((article.description != null)? article.description:''),
    );
  }
}

class _ImageCard extends StatelessWidget {

  final Article article;

  const _ImageCard({
    @required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (article.urlToImage != null)
            ? FadeInImage(
              placeholder: AssetImage('assets/img/giphy.gif'), 
              image: NetworkImage(article.urlToImage)
              )
              :Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {

  final Article article;

  const _TitleCard({
    @required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(article.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}
class _TopBarCard extends StatelessWidget {

  final Article article;
  final int index;

  const _TopBarCard({
    @required this.article,
    @required this.index
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index +1}. ', style: TextStyle(color: myTheme.accentColor)),
          Text('${article.source.name}. ')
        ],
      ),
    );
  }
}
