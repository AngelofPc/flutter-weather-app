import 'package:flutter/material.dart';
import 'package:aceweatherapp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:aceweatherapp/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocationData();
  }
  void getLocationData() async {

    //this is same as
    //WeatherModel weatherModel = WeatherModel();
    //var weatherData = await weatherModel.getLocationWeather();

    //same as this
    var weatherData = await WeatherModel().getLocationWeather();

      //open location screen
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
