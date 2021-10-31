// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';


class Groceries extends StatefulWidget {
  const Groceries({ Key? key }) : super(key: key);

  @override
  _GroceriesState createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("Groceries"))
      )
    );
  }
}