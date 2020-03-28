import 'location.dart';
import 'networking.dart';

const apiKey = '5c3ea4526e564c0cc9bdbe016f1cbfc9';
const openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    String url = '$openWeatherApi?q=$cityName&appid=$apiKey&units=metric';
    var decodeData = await NetworkHelper(url).getData();

    return decodeData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    String url =
        '$openWeatherApi?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);
    var decodeData = await networkHelper.getData();

    return decodeData;
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
