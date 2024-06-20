import 'dart:async';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motoveys/Screens/claimsDashboard.dart';
import 'package:motoveys/Screens/loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    // DashboardPage()
                    LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      height: 70,
                      child: Image.asset('lib/assests/sbilogo.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.directions_car_filled,
                    size: 81,
                    color: Color.fromRGBO(13, 12, 70, 1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: const Color.fromRGBO(13, 12, 70, 1),
                      size: 41,
                    ),
                  )
                ])));
  }
}
