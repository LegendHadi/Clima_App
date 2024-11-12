import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation()async{
    final androidSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
    );

var permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.whileInUse || permission == LocationPermission.always){
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: androidSettings,);
    debugPrint('location $position');
  } else {
    permission = await Geolocator.requestPermission();
  }
    
    // debugPrint(position.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
