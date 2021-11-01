// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:convert';

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';

class Cars extends StatefulWidget {
  final Map UserData;
  const Cars({Key? key, required this.UserData}) : super(key: key);

  @override
  _CarsState createState() => _CarsState();
}

String userName = "null";
String userEmail = "null";

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    if (widget.UserData != null) {
      print("=========================jjjjjj==============dg===========>${userEmail}");
      userEmail = widget.UserData['email'];
      userName = widget.UserData['Name'];
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyDeal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (1 / 1.2),
        children: [
          item(
              Titel: "Toyota corolla altis grande 2020 first owner excellent condition",
              Price: "3,650,000",
              Rating: 5,
              Description:
                  """Toyota Corolla Altis grande 2020
First owner demand 3650 
Excellent condition (View phone number)
Fully loaded top of the line car 
22000km driven
Tv navigation system back camera alloy rims leather seats sunroof automatic transmission just like brand new car through out maintained from dealership""",
              Img:
                  "https://images.olx.com.pk/thumbnails/198884218-400x300.webp",
              Discount: "1034",
              author: "Olx User",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel:
                  "Toyota Prado TX Limited 2.7 2005",
              Price: "5,700,000",
              Rating: 4,
              Description:
                  """Total Genuine Car, very nicely maintained. 
Model 2005
Registered 2008
Car can be seen in Peshawar University Campus. 
Peshawar Registered, without sunroof.""",
              Img:
                  "https://images.olx.com.pk/thumbnails/176848310-400x300.webp",
              Discount: "5,900,000",
              author: "Muhammad Hanif",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel: "Electrical Goods, Electric Equipment",
              Price: "750,000",
              Rating: 5,
              Description:
                  """Toyota land cruiser bj40 
Karachi sindh number 
file bye hand 
2l diesel engine 2400cc 
location GT road Taru jabba""",
              Img:
                  "https://images.olx.com.pk/thumbnails/199721534-400x300.webp",
              Discount: "750,000",
              author: "Malik",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel: "TOYOTA COROLLA GLI MANUAL EXCELLENT CONDITION",
              Price: "2,165,000",
              Rating: 3,
              Description: """PRICE IS FINAL NO BARGAINING!! 
No work required
Good condition
Tax up to date
Complete file""",
              Img:
                  "https://images.olx.com.pk/thumbnails/177798131-400x300.webp",
              Discount: "2,195,000",
              author: "Rameez",
              userName: userName,
              userEmail:userEmail),
        ],
      )),
    );
  }
}
