import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';

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
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    debugPrint('location latitude ${location.latitude}');
    debugPrint('location longitude ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
