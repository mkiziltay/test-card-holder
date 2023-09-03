import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 0)
class CardInfo extends HiveObject{
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String cvvCode;
  @HiveField(2)
  final String expDate;
  @HiveField(3)
  final String cardNumber;
  @HiveField(4)
  final String? cardCategory;
  @HiveField(5)
  final String leftColor;
  @HiveField(6)
  final String rightColor;
  @HiveField(7)
  double positionY = 0;
  @HiveField(8)
  double rotate = 0;
  @HiveField(9)
  double scale = 0;
  @HiveField(10)
  double opacity = 0;
  @HiveField(11)
  final int id ;
  
  CardInfo({
    required this.id,
    required this.userName,
    required this.cardCategory,
    required this.leftColor,
    required this.cvvCode,
    required this.expDate,
    required this.cardNumber,
    required this.rightColor,
    this.positionY = 0,
    this.rotate = 0,
    this.scale = 0,
    this.opacity = 0,
  });
}
