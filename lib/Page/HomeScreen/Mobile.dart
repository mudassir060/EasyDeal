// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:convert';

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  final Map UserData;
  const Mobile({Key? key, required this.UserData}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

String userName = "null";
String userEmail = "null";

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    if (widget.UserData != null) {
      print(
          "=========================jjjjjj==============dg===========>${userEmail}");
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
              Titel:
                  "Samsung Stock S21 Ultra / Note 20 Ultra / Note 10 Plus PTA Approved",
              Price: " 70,000",
              Rating: 3,
              Description:
                  """01. S21 Ultra 12GB / 128GB Snapdragon 888 5G Phantom Black Single Sim (Non Approved) Rs. 130k

02. Note 20 Ultra 12GB / 256GB Orignal Pen Mystic Bronze Dual Sim (PTA Approved) Rs. 125k

03. Note 20 Ultra 12GB / 512GB Orignal Pen Mystic Black Single Sim (Offcial Approved) Rs. 145k

04. Note 20 Ultra 8GB / 256GB Orignal Pen Mystic Bronze Dual Sim (PTA Approved) Rs. 115k
""",
              Img:
                  "https://images.olx.com.pk/thumbnails/199486118-400x300.webp",
              Discount: " 70,000",
              author: "SSTrading",
              userName: userName,
              userEmail: userEmail),
          item(
              Titel: "iphone 11 pro non pta",
              Price: "70,000",
              Rating: 3,
              Description:
                  """iphone 11 pro 256gb screen crack touch working 100% fine. face id true tone everything else perfectly fine and sealed 85 battery health (90000)

iphone  11 pro 64gb icloud lock 95 battery health everything else perfectly fine (70000)

both are scratchless and came from USA price almost final hi hai discount ke liye msg na karen shukriya.""",
              Img:
                  "https://images.olx.com.pk/thumbnails/199730538-400x300.webp",
              Discount: "80,000",
              author: "Olx User",
              userName: userName,
              userEmail: userEmail),
          item(
              Titel: "Iphone X(PTA Approved) all okay",
              Price: "67,000",
              Rating: 5,
              Description: """Iphone X PTA approved Face id ok
cond : 10/10""",
              Img:
                  "https://images.olx.com.pk/thumbnails/179644938-400x300.webp",
              Discount: "67,000",
              author: "Projector point",
              userName: userName,
              userEmail: userEmail),
          item(
              Titel: "Apple Iphone X 64 Approved",
              Price: "77,000",
              Rating: 3,
              Description: """Available

Apple Iphone X

Colour : Black/White

Price : 

64gb 57000

256gb 60000
""",
              Img:
                  "https://images.olx.com.pk/thumbnails/126000430-400x300.webp",
              Discount: "77,600",
              author: "Exit - Mobile Home",
              userName: userName,
              userEmail: userEmail),
        ],
      )),
    );
  }
}
