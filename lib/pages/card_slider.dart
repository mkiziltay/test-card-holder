import 'dart:math';
import 'package:credit_card_animation/animation/flipper_animation.dart';
import 'package:credit_card_animation/data/data_operations.dart';
import 'package:credit_card_animation/pages/card_input_page.dart';
import 'package:credit_card_animation/widgets/card_back.dart';
import 'package:credit_card_animation/widgets/card_front.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../model/card_model.dart';

class CardSlider extends StatefulWidget {
  final double height;
  final Function(bool) confirm;
  const CardSlider({
    Key? key,
    required this.height,
    required this.confirm,
  }) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  late double positionY_line1;
  late double positionY_line2;
  late List<CardInfo> _cardInfoList;
  late double _middleAreaHeight;
  late double _outsiteCardInterval;
  late double scrollOffsetY;
  final HiveDataStore myController = Get.find<HiveDataStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    positionY_line1 = widget.height * 0.1;
    positionY_line2 = positionY_line1 + 200;
    widget.confirm(false);

    //TODO: *auto refresh widget *secure storage *input page widget reDesign
    myController.getBox().values.obs;

    _middleAreaHeight = positionY_line2 - positionY_line1;
    _outsiteCardInterval = 30.0;
    scrollOffsetY = 0.0;
    _cardInfoList = [
      CardInfo(
        id: 0,
        userName: "MK MKIZILTAY1",
        cardNumber: '1234 4321 1234 4321',
        expDate: '1234',
        cvvCode: '4321',
        cardCategory: 'mastercard',
        leftColor: 'pink',
        rightColor: 'red',
      ),
      CardInfo(
        id: 1,
        userName: "MK MKIZILTAY2",
        cardNumber: '1111 2222 3333 4444',
        expDate: '1223',
        cvvCode: '1122',
        cardCategory: 'visa',
        leftColor: 'black',
        rightColor: 'black',
      ),
      CardInfo(
        id: 2,
        userName: "MK MKIZILTAY3",
        cardNumber: '3132 3123 2132 1312',
        expDate: '1126',
        cvvCode: '321',
        cardCategory: 'visa',
        leftColor: 'pinkAccent',
        rightColor: 'pinkAccent',
      ),
      CardInfo(
        id: 3,
        userName: "MK MKIZILTAY",
        cardNumber: '9436 5934 5934 6556',
        expDate: '1127',
        cvvCode: '765',
        cardCategory: 'mastercard',
        leftColor: 'blue',
        rightColor: 'bluelight',
      ),
      CardInfo(
        id: 4,
        userName: "MK MKIZILTAY",
        cardNumber: '1234 4321 1234 4321',
        expDate: '1234',
        cvvCode: '4321',
        cardCategory: 'visa',
        leftColor: 'red',
        rightColor: 'redAccent',
      ),
      CardInfo(
        id: 5,
        userName: "MK MKIZILTAY",
        cardNumber: '1111 2222 3333 4444',
        expDate: '1223',
        cvvCode: '1122',
        cardCategory: 'mastercard',
        leftColor: 'yellow',
        rightColor: 'redAccent',
      ),
      CardInfo(
        id: 6,
        userName: "MK MKIZILTAY",
        cardNumber: '3132 3123 2132 1312',
        expDate: '1126',
        cvvCode: '321',
        cardCategory: 'visa',
        leftColor: 'yellow',
        rightColor: 'redAccent',
      ),
      CardInfo(
        id: 7,
        userName: "MK MKIZILTAY",
        cardNumber: '9436 5934 5934 6556',
        expDate: '1127',
        cvvCode: '765',
        cardCategory: 'mastercard',
        leftColor: 'maroon',
        rightColor: 'maroonlight',
      ),
    ];

    for (int i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[i];
      if (i == 0) {
        cardInfo.positionY = positionY_line1;
        cardInfo.opacity = 1.0;
        cardInfo.rotate = 1.0;
        cardInfo.scale = 1.0;
      } else {
        cardInfo.positionY = positionY_line2 + (i - 1) * 30;
        cardInfo.opacity = 0.7 - (i - 1) * 0.1;
        cardInfo.rotate = -60;
        cardInfo.scale = 0.9;
      }
    }

    //myController.clearBox();
    _cardInfoList.clear();
    //fillBoxes();
    _cardInfoList.isEmpty
        //? _cardInfoList = _cardsBox.values.toList().cast<CardInfo>()
        ? _cardInfoList = myController
            .getBox()
            .values
            .toList()
            .reversed
            .toList()
            .cast<CardInfo>()
        : _cardInfoList = _cardInfoList.reversed.toList();
  }

  _cardBuild() {
    List widgetList = [];

    for (CardInfo cardInfo in _cardInfoList) {
      widgetList.add(
        Positioned(
          top: cardInfo.positionY,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(pi / 180 * cardInfo.rotate)
              ..scale(cardInfo.scale),
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: cardInfo.opacity,
              child: FlipperAnimation(
                  frontWidget: CardFront(cardInfo: cardInfo),
                  backWidget: CardBack(cardInfo: cardInfo)),
            ),
          ),
        ),
      );
    }
    print('++++++++++++++++++++++++++++++++++++++++++${widgetList.length}');
    return widgetList;
  }

  // * position update function

  void _updateCardPosition(double offsetY) {
    scrollOffsetY += offsetY;

    void updatePosition(CardInfo cardInfo, double firstCardAreaIdx, int index) {
      // cardInfo.positionY += offsetY;
      double currentCardAreaIdx = firstCardAreaIdx + index;
      if (currentCardAreaIdx < 0) {
        cardInfo.positionY = positionY_line1 + currentCardAreaIdx * 5;

        cardInfo.scale =
            1.0 - 0.2 / 10 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.scale < 0.8) cardInfo.scale = 0.8;
        if (cardInfo.scale > 1) cardInfo.scale = 1.0;

        // * rotate card
        cardInfo.rotate = -90.0 / 5 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -90.0) cardInfo.rotate = -90.0;

        // Opacity 1.0 --> 0.7
        cardInfo.opacity =
            1.0 - 0.7 / 5 * (positionY_line1 - cardInfo.positionY);

        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1) cardInfo.opacity = 1.0;
      } else if (currentCardAreaIdx >= 0 && currentCardAreaIdx < 1) {
        cardInfo.scale = 1.0 -
            0.1 /
                (positionY_line2 - positionY_line1) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.scale < 0.9) cardInfo.scale = 0.9;
        if (cardInfo.scale > 1) cardInfo.scale = 1.0;
        // move 1:1
        cardInfo.positionY =
            positionY_line1 + currentCardAreaIdx * _middleAreaHeight;
        // * rotate card
        cardInfo.rotate = -60.0 /
            (positionY_line2 - positionY_line1) *
            (cardInfo.positionY - positionY_line1);
        if (cardInfo.rotate > 0.0) cardInfo.rotate = 0.0;
        if (cardInfo.rotate < -60.0) cardInfo.rotate = -60.0;

        // Opacity
        cardInfo.opacity = 1.0 -
            0.3 /
                (positionY_line2 - positionY_line1) *
                (cardInfo.positionY - positionY_line1);
        if (cardInfo.opacity < 0.0) cardInfo.opacity = 0.0;
        if (cardInfo.opacity > 1) cardInfo.opacity = 1.0;
      } else if (currentCardAreaIdx >= 1) {
        cardInfo.positionY =
            positionY_line2 + (currentCardAreaIdx - 1) * _outsiteCardInterval;
        cardInfo.rotate = -60.0;
        cardInfo.scale = 0.9;
        cardInfo.opacity = 0.7;
      }
    }

    double firstCardAreaIdx = scrollOffsetY / _middleAreaHeight;
    //print("first card area idx: $firstCardAreaIdx");
    setState(() {
      // CardInfo cardInfo = _cardInfoList.last;
      // updatePosition(cardInfo, firstCardAreaIdx, 0);
    });

    for (int i = 0; i < _cardInfoList.length; i++) {
      CardInfo cardInfo = _cardInfoList[_cardInfoList.length - 1 - i];
      updatePosition(cardInfo, firstCardAreaIdx, i);
      setState(() {
        // cardInfo.positionY += offsetY;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails d) {
        if (scrollOffsetY / _middleAreaHeight > 1) {
          _updateCardPosition(0);
          //print('dy ${d.delta.dy}');
          //print('d ${d}');
          //print('dx ${d.delta.dx}');
          //print('last idx ${myController.getBox().values.length}');
        } else if (scrollOffsetY / _middleAreaHeight >
            -(myController.getBox().values.length)) {
          _updateCardPosition(d.delta.dy);
        } else {
          _updateCardPosition(1);
        }
      },
      onVerticalDragEnd: (DragEndDetails d) {
        scrollOffsetY =
            (scrollOffsetY / _middleAreaHeight).round() * _middleAreaHeight;
        _updateCardPosition(0);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: Color.fromARGB(255, 230, 228, 232),
        decoration: BoxDecoration(
            color: Color(0xFF0B258A).withOpacity(.1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
        // color: Colors.amber,
        child: Stack(alignment: Alignment.topCenter, children: [
          // * top title
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "YOUR SECURED CARD",
                style: TextStyle(
                    color: Color.fromARGB(255, 18, 71, 162),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
          // * line 1
          ,
          // Positioned(
          //   top: positionY_line1,
          //   child: Container(
          //     height: 1,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.red,
          //   ),
          // ),
            ..._cardBuild(),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(0, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
            ),
          ),
          // * line 2
          // Positioned(
          //   top: positionY_line2,
          //   child: Container(
          //     height: 1,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.red,
          //   ),
          // ),

          // * bottom row
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard,
                      color: Colors.grey,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  */
                  TextButton(
                      onPressed: () {
                        widget.confirm(true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreditCardPage()));
                        //print("tab");
                      },
                      child: Container(
                        height: 50,
                        width: 160,
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                                color: Color(0xFF0B258A).withOpacity(.5),
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                          shape: StadiumBorder(),
                          color: Color(0xFF0B258A),
                        ),
                        child: Center(
                          child: Text(
                            "+ Add new card",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )),
                  /*
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.mic,
                      color: Colors.grey,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                  )
                  */
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
