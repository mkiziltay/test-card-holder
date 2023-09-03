import 'package:credit_card_animation/model/card_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDataStore extends GetxController {
  static const boxName = 'cards';
  static Box<CardInfo> box = Hive.box<CardInfo>(boxName);
  var itemcount = 0.obs;

  /// Add new Card
  /// //TODO: edit card input id...
  Future<void> addCard({required CardInfo card}) async {
    await box.put(card.cvvCode, card);
    itemcount.value = box.values.length;
  }

  /// Show Card
  Future<CardInfo?> getCard({required String id}) async {
    return box.get(id);
  }

  /// Update Card
  Future<void> updateCard({required CardInfo card}) async {
    await card.save();
  }

  /// Delete Card
  Future<void> deleteCard({required CardInfo card}) async {
    await card.delete();
  }
  /// Delete Card By index
  Future<void> deleteCardByIdx({required int index}) async {
    await box.getAt(index)?.delete();
  }
//TODO: add listener method
/*
  ValueListenable<Box<CardInfo>> listenToCard() {
    return box.listenable();
  }*/

  Box<CardInfo> getBox() {
    return box;
  }

  Future<int> clearBox() {
    return box.clear();
  }

  void fillBoxes(Box<CardInfo> mybox) async {
    box.put(
        1,
        CardInfo(
          id: 0,
          userName: "MK a",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'red',
          rightColor: 'redAccent',
        ));
    box.put(
        2,
        CardInfo(
          id: 1,
          userName: "MK b",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'yellow',
          rightColor: 'pink',
        ));
    box.put(
        3,
        CardInfo(
          id: 2,
          userName: "MK c",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'blue',
          rightColor: 'bluelight',
        ));
    box.put(
        4,
        CardInfo(
          id: 3,
          userName: "MK d",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'maroon',
          rightColor: 'maroonlight',
        ));
    box.put(
        5,
        CardInfo(
          id: 4,
          userName: "MK e",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'pink',
          rightColor: 'red',
        ));
    box.put(
        6,
        CardInfo(
          id: 5,
          userName: "MK f",
          cardNumber: '9436 5934 5934 6556',
          expDate: '1127',
          cvvCode: '765',
          cardCategory: 'mastercard',
          leftColor: 'black',
          rightColor: 'black',
        ));

    //print(box.values.first.leftColor);
    box = mybox;
  }
}
