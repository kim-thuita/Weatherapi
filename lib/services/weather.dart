import 'package:weatherapi/services/network.dart';
import 'package:weatherapi/services/location.dart';
import 'package:geolocator/geolocator.dart';

const apikey = '9ad3b450a393863d51b88633bafd62ab';
const mapweatherurl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityWeather(String cityname) async {
    var url = '$mapweatherurl?q=$cityname&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$mapweatherurl?lat=${location.latitude}.34&lon=${location.longitude}.99&appid=$apikey&units=metric');

    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

void requestPermission() async {
  LocationPermission permission = await Geolocator.requestPermission();
  print(permission);
}
