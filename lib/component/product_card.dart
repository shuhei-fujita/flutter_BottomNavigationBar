import 'package:flutter/material.dart';
import 'package:flutterbottomnavigationbar/page/product_detail.dart';

class ProductCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(

      onTap: () async {
        print("tapped");
        Navigator.of(context).pushNamed(
          ProductDetail.routeName,
        );
      },

      child: Container(
        margin: EdgeInsets.all(16),

        child: Column(

            children: <Widget>[
              SizedBox(
                height: 40,
                child: Text("ここにタイトルが入ります"),
              ),
              Text("円")
            ]

        ),

      ),
    );
  }

}
