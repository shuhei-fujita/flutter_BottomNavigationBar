import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbottomnavigationbar/page/page_product_list.dart';
import 'package:flutterbottomnavigationbar/page/page_profile.dart';
import 'package:flutterbottomnavigationbar/page/page_search.dart';
import 'package:flutterbottomnavigationbar/page/page_store.dart';
import 'package:flutterbottomnavigationbar/page/product_detail.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

      routes: {
        ProductDetail.routeName: (context) => ProductDetail()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    PageProductList(),
    PageStore(),
    PageProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
          "https://samples.openweathermap.org/data/2.5/weather?id=524901&appid=870204681a9e190d574a080346a80562"
        ),
//        headers: {
//          "Accept": "application/json",
//          HttpHeaders.authorizationHeader: "FWI1TQPfH_lxb7VdzE1NVLBRDEojLPfxexrKV8begw8",
//        }
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("リクエスト成功");

      String data = response.body;
      print(data);
    } else {
      print("リクエスト失敗");
    }
  }

  @override
  Widget build(BuildContext context) {

    getData();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: Text('カート'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('アカウント'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => PageSearch()),
//          );
        },
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

}
