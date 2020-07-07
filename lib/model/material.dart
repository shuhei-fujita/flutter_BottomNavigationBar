import 'package:flutterbottomnavigationbar/model/user.dart';

class SuzuriMaterial {
  final int id;
  final int price;
  final String title;
  final String description;
  final bool violation;
  final String dominantRGB;
  final String textureURL;
  final User user;

  SuzuriMaterial({
    this.id,
    this.price,
    this.title,
    this.description,
    this.violation,
    this.dominantRGB,
    this.textureURL,
    this.user,
  });

}
