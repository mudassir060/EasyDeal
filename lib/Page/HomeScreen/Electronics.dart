// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';

class Electronics extends StatefulWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EasyDeal',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Scaffold(body: Center(child: Text("Electronics"))));
  }
}
