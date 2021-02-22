import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavigationModel(),
        child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (value) => navigationModel.currentPage = value,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'For You'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headers')
      ],
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);
    
    return PageView(
      controller: navigationModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color:Colors.red
        ),
        Container(
          color: Colors.green
        )
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier{

  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => this._currentPage;

  set currentPage(int value){
    this._currentPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
  
}