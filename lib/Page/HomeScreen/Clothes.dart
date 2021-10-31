// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';

class Clothes extends StatefulWidget {
  const Clothes({Key? key}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clothes',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Scaffold(body: Center(child: Text("Clothes"))));
  }
}
