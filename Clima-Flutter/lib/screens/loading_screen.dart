import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
const apiKey = '5c3ea4526e564c0cc9bdbe016f1cbfc9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void  getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);

    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
    NetworkHelper networkHelper = new NetworkHelper(url);

    var decodeData = await networkHelper.getData();
    String cityName = decodeData['name'];

    Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: decodeData);
    }));
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.00,
        ),
      ),
    );
  }
}
