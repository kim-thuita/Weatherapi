import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapi/services/weather.dart';
import 'package:weatherapi/screen/locationscreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    requestPermission();
    getLocation();
  }

  void getLocation() async {
    WeatherModel weatherModel = await WeatherModel();
    var weatherdata = await weatherModel.getWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.lime,
          size: 100.0,
        ),
      ),
    );
  }
}
