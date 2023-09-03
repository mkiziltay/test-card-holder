import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPalette {
  static Color maroon = const Color.fromARGB(255, 171, 51, 75);
  static Color maroonlight = const Color.fromARGB(255, 224, 63, 92);
  static Color blue = Color.fromARGB(255, 25, 51, 158);
  static Color bluelight = const Color.fromARGB(255, 49, 69, 147);
  static Color pink = const Color.fromARGB(255, 234, 94, 190);
  static Color red = const Color.fromARGB(255, 224, 63, 92);
  static Color redAccent = Colors.redAccent;
  static Color pinkAccent = Colors.pinkAccent;
  static Color yellow = Color.fromARGB(255, 229, 190, 35);
  static Color black = Color.fromARGB(255, 10, 10, 10);

  Color strToColor(String string) {
    late Color color;
    switch (string) {
      case 'maroon':
        color = maroon;
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'maroonlight':
        color = maroonlight;
        break;
      case 'blue':
        color = blue;
        break;
      case 'bluelight':
        color = bluelight;
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'pink':
        color = pink;
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'red':
        color = red;
        break;
      case 'redAccent':
        color = redAccent;
        break;
      case 'pinkAccent':
        color = pinkAccent;
        break; // The switch statement must be told to exit, or it will execute every case.
      case 'yellow':
        color = yellow;
        break;
      case 'black':
        color = black;
        break;
      default:
        color = Color(0xFFFFFF);
    }

    return color;
  }
}
