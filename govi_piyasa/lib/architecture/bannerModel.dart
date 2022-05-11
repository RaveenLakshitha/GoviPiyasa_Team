import 'package:flutter/material.dart';

class BannerModel {
  String text;
  List<Color> cardBackground;
  String image;

  BannerModel(this.text, this.cardBackground, this.image);
}

List<BannerModel> bannerCards = [
  new BannerModel(
      "Create Shop",
      [
        Color(0xffa1d4ed),
        Color(0xffc0eaff),
      ],
      "assets/shop.jpg"),
  new BannerModel(
      "Architect Profile",
      [
        Color(0xffb6d4fa),
        Color(0xffcfe3fc),
      ],
      "assets/architect.jpg"),
];
