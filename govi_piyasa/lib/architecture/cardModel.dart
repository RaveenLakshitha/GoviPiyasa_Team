import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class CardModel {
  String doctor;
  int cardBackground;
  var cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}

List<CardModel> cards = [
  new CardModel("Seeds", 0xFFec407a, Icons.wheelchair_pickup_sharp),
  new CardModel("Plants", 0xFF5c6bc0, Icons.wheelchair_pickup_sharp),
  new CardModel("Organic Fertilizer Production", 0xFF1565C0, Icons.wheelchair_pickup_sharp),
  new CardModel("Pesticides", 0xFF2E7D32, Icons.wheelchair_pickup_sharp),
];