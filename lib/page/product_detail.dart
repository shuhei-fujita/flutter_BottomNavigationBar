import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  // 画面を遷移するために必要なウィジェットの名前を定義する
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品詳細"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "とりあえず商品名でも表示してみる"
//            product.title,
          ),
        ),
      ),
    );
  }
}
