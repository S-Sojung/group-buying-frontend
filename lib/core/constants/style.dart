
import 'package:flutter/material.dart';

import 'theme.dart';




TextStyle largeTitle({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle title1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: mColor);
}
TextStyle title2({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle donutTitle() {
  return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(
          blurRadius: 10.0,
          color: donutColorBase,
          offset: Offset(0.0, 0.0),
        ),
      ],
      color: Colors.white);
}

TextStyle headLine({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: mColor);
}

TextStyle bodyText({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 17, color: mColor);
}

TextStyle callout({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 16, color: mColor);
}

TextStyle subHead({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: mColor);
}
TextStyle footnote({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 13, color: mColor);
}
TextStyle caption1({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 12, color: mColor);
}
TextStyle caption2({Color mColor = Colors.black}) {
  return TextStyle(fontSize: 11, color: mColor);
}