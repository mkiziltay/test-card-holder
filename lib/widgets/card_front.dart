import 'package:credit_card_animation/colors/colors.dart';
import 'package:credit_card_animation/model/card_model.dart';
import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  const CardFront({
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
          gradient: LinearGradient(
              colors: [
              ColorPalette().strToColor(cardInfo.leftColor),
              ColorPalette().strToColor(cardInfo.rightColor)
            ])),
      child: Stack(children: [
        // * Number
        Positioned(
          top: 130,
          left: 20,
          child: Text(
            cardInfo.cardNumber,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.5,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
            
        // * Card Name
        Positioned(
          top: 160,
          left: 20,
          child: Text(
            cardInfo.userName,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.5,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
        // * network
        Positioned(
          top: 30,
          right: 70,
          child: SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                "assets/globe.png",
                // color: Colors.go,
              )),
        ),
        // * sim card
            
        Positioned(
          left: 0,
          top: 70,
          child: Row(
            children: [
              Container(
                height: 40,
                width: 80,
                // color: Colors.deepOrange,
                child: Image.asset(
                  "assets/sim.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 20,
                width: 25,
                child: Image.asset(
                  "assets/signal.png",
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
            
        // * Card Logo
        Positioned(
          right: 10,
          bottom: 5,
          child: Container(
            height: 60,
            width: 60,
            child: cardInfo.cardCategory == 'visa' ? Image.asset("assets/visaLogo.png") : Image.asset("assets/mastercardLogo.png"),
          ),
        ),
      ]),
    );
  }
}