import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    debugPrint('location latitude ${location.latitude}');
    debugPrint('location longitude ${location.longitude}');
  }

  void getData ()async{
    Response response= await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=500c9d7b7987ee49fecbeb4f04feae0e'));
    if (response.statusCode == 200){
      String data = response.body;
      debugPrint('current weather: $data');
    }else{
      debugPrint(response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
