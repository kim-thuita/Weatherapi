import 'package:flutter/material.dart';
import 'package:weatherapi/screen/city_screen.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextfield =
    InputDecoration(
filled: true,
fillColor: Colors.white,
icon: Icon(Icons.location_city),
hintText: 'Enter City name',
hintStyle: TextStyle(
color: Colors.grey,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(15)),
),
),
