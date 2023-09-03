import 'package:credit_card_animation/colors/colors.dart';
import 'package:credit_card_animation/model/card_model.dart';
import 'package:flutter/material.dart';

class CardBack extends StatelessWidget {
  const CardBack({
    super.key,
    required this.cardInfo,
  });

  final CardInfo cardInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 10,
                  offset: Offset(5, 10))
            ],
            color: Colors.red,
            gradient: LinearGradient(colors: [
              ColorPalette().strToColor(cardInfo.leftColor),
              ColorPalette().strToColor(cardInfo.rightColor)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                height: 38,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: Container(
                        height: 48,
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(cardInfo.cvvCode, //cvv
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.5,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 16,top: 6),
                    child: Image.asset(
                      "assets/globe-elips.png",
                      // color: Colors.go,
                    )),
              ),
            ),
          ],
        ));
  }
}
/*
class CardBack extends StatelessWidget {
  const CardBack({
    super.key,
    required this.cardInfo,
  });

  final CardInfo cardInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
      color: Colors.black.withOpacity(.3),
      blurRadius: 10,
      offset: Offset(5, 10))
          ],
          color: Colors.red,
          gradient: LinearGradient(colors: [cardInfo.leftColor, cardInfo.rightColor])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              height: 38,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Container(
                      height: 48,
                      color: Colors.white70,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          '1234', //cvv
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.5,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16),
                  child: Image.asset(
                    "assets/globe.png",
                    // color: Colors.go,
                  )),
            ),
          ),
        ],
      ));
  }
}
*/