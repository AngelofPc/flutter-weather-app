import 'package:aceweatherapp/services/location.dart';
import 'package:aceweatherapp/services/networking.dart';

const apiKey = 'bc926d78f1735fff20ee3ea2fffcd7ad';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future getCityName(String cityName) async {

    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;

  }

  Future<dynamic> getLocationWeather() async {
  //get current location
  Location location = Location();
  await location.getCurrentLocation();

  //get weather info
  NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

  var weatherData = await networkHelper.getData();

  return weatherData;

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
