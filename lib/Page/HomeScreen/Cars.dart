// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';


class Cars extends StatefulWidget {
  const Cars({ Key? key }) : super(key: key);

  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
             debugShowCheckedModeBanner: false,
      title: 'Cars',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(child: Text("Cars"))
      )
    );
  }
}