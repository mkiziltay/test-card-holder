import 'package:credit_card_animation/data/data_operations.dart';
import 'package:credit_card_animation/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/main_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final HiveDataStore myController = Get.put(HiveDataStore());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CardInfoAdapter());
  var mybox = await Hive.openBox<CardInfo>('cards');
  myController.fillBoxes(mybox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Card Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "ocr-a",
      ),
      home: CreditCard(), //TODO: Edit android/gradle.properties file for java jdk location
    );
  }
}
