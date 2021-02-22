import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tabs_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TabsPage()
    );
  }
}