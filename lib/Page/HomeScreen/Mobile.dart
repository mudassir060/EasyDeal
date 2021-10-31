// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:flutter/material.dart';


class Mobile extends StatefulWidget {
  const Mobile({ Key? key }) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("Mobile"))
      )
    );
  }
}