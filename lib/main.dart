import 'package:flutter/material.dart';
import 'package:flutterbottomnavigationbar/page/page_product_list.dart';
import 'package:flutterbottomnavigationbar/page/page_profile.dart';
import 'package:flutterbottomnavigationbar/page/page_store.dart';
import 'package:flutterbottomnavigationbar/page/product_detail.dart';
import 'package:flutterbottomnavigationbar/component/product_card.dart';

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

//  static const TextStyle optionStyle =
//  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//  static const List<Widget> _widgetOptions = <Widget>[
//    Text(
//      'Index 0: Home',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 1: Business',
//      style: optionStyle,
//    ),
//    Text(
//      'Index 2: School',
//      style: optionStyle,
//    ),
//  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
//      _productsList(context),
      Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _productsList(BuildContext context) {
    return Container(
      // GridViewはウィジェットをグリッドで表示してくれるウィジェット
      // iOS UIKitで言うところの UICollectionView
      // GridView.builderというfactory(カスタムコンストラクタ)で初期化する
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // グリッド横方向のウィジェット数
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            // グリッド表示するウィジェットの縦横比
            childAspectRatio: 0.7,
          ),
          // グリッドに表示したいウィジェットの数
          itemCount: 6,
          // itemBuilderはGridViewのインデックス毎に表示したいウィジェットを返すデリゲート
          // context, indexを引数にとり、ウィジェットを返す関数を指定してやる
          // itemContの回数だけ呼ばれる、この例では6回
          itemBuilder: (context, index) {
            // とりあえずグレーのコンテナを表示してみる
            return ProductCard();
          }),
    );
  }

}
