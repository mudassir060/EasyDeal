// ignore_for_file: annotate_overrides, file_names

import 'dart:async';
import 'package:easydeals/Api/login.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: 400,
            height: 200,
            child: Image.asset('images/Logo.png'),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const CircularProgressIndicator(
            color: Colors.green,
          )),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const Text(
            "EasyDeals Is Loading",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
      ),
    ));
  }
}
