import 'package:flutterbottomnavigationbar/model/item.dart';
import 'package:flutterbottomnavigationbar/model/material.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final int discountedPrice;
  final String imageUrl;
  final List<String> imageUrls;
  final String sampleImageUrl;
  final List<String> sampleImageUrls;
  final String sampleUrl;
  final int quantityLimit;
  final int remainingQuantity;
  final Item item;
  final SuzuriMaterial material;

  Product({
    this.id,
    this.title,
    this.price,
    this.discountedPrice,
    this.imageUrl,
    this.imageUrls,
    this.sampleImageUrl,
    this.sampleImageUrls,
    this.sampleUrl,
    this.quantityLimit,
    this.remainingQuantity,
    this.item,
    this.material,
  });

}
