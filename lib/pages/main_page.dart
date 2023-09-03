import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:credit_card_animation/data/data_operations.dart';
import 'package:credit_card_animation/main.dart';
import 'package:credit_card_animation/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'card_slider.dart';

class CreditCard extends StatefulWidget {
  final HiveDataStore myController = Get.find<HiveDataStore>();
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>
    with SingleTickerProviderStateMixin {
  bool _confirm = false;
  var list =
      myController.getBox().values.toList().cast<CardInfo>().obs;
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  int _selectedIndex = 0;

  List<String> _tabs = ["Del Last Secured Card", " ", " "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, right: 25, left: 20),
            decoration: BoxDecoration(
              color: Color(0xFF0B258A),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.4)),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                      size: 20,
                    )),
                  ),
                  // Spacer(),
                  Text(
                    "Select Card",
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                          color: Colors.white.withOpacity(.5),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/IMG_5706.JPG"))),
                    // child: Center(child: ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, MKIZILTAY",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flash(
                child: BlurryContainer(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Balance",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Text(
                                    list.length.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.currency_bitcoin,
                                      color: Color(0xFF0B258A),
                                    ))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  blur: 50,
                  width: 300,
                  height: 100,
                  elevation: 0,
                  color: Colors.grey.withOpacity(.4),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ]),
          ),
          Spacer(),
          Container(
            height: 50,
            child: ListView.builder(
                itemCount: _tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return SlideInLeft(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                            myController.deleteCard(
                                card: myController.getBox().values.last);
                            debugPrint(" deleted...................");
                          });
                        },
                        child: Text(
                          _tabs[index],
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: index == _selectedIndex
                                  ? Color(0xFF0B258A)
                                  : Color(0xFF0B258A).withOpacity(.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .55,
              // color: Color.fromARGB(255, 230, 228, 232),
              // color: Colors.amber,
              child: SlideInUp(
                child: CardSlider(
                  height: MediaQuery.of(context).size.height * .6,
                  confirm: (confirm) {
                    _confirm = confirm;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
