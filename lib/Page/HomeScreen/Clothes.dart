// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:convert';

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';

class Clothes extends StatefulWidget {
  final Map UserData;
  const Clothes({Key? key, required this.UserData}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

String userName = "null";
String userEmail = "null";

class _ClothesState extends State<Clothes> {
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
              Titel: "Men's wedding Sherwani",
              Price: "8,000",
              Rating: 3,
              Description:
                  """
Men's full Sherwani set Medium size excellent quality with Kulla and Khussa. . wore only once . . prices are negotiable""",
              Img:
                  "https://images.olx.com.pk/thumbnails/199734749-400x300.webp",
              Discount: "9,034",
              author: "Hafiz Imran",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel:
                  "Denim jacket with full furr (stock available)",
              Price: "2,699",
              Rating: 2,
              Description:
                  """jackets for mens
full furr jackets export quality
A grade premium stuff
orignal pics attached no editing
medium
large
xL
stock available
divery all over pakistan """,
              Img:
                  "https://images.olx.com.pk/thumbnails/199513237-400x300.webp",
              Discount: "2,899",
              author: "Olx user",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel: "Bin Liaquat Fabrics Wholesaler",
              Price: "2,400",
              Rating: 5,
              Description:
                  """Beautiful #Dori & #Pearls #Mirror Work

Shirt Front Fully Emb 
Shirt Back Plain
Masori Trouser 
Net Gotta & Mirror Work Dupatta""",
              Img:
                  "https://images.olx.com.pk/thumbnails/179644938-400x300.webp",
              Discount: "2,600",
              author: "Bin Liaquat Fabrics Wholesaler ",
              userName: userName,
              userEmail:userEmail),
          item(
              Titel: "Fancy wedding Dress",
              Price: "9,000",
              Rating: 3,
              Description: """
Only once used on walima, Fresh and Neat and Clean Dress. Front open back tale. . Stylish design""",
              Img:
                  "https://images.olx.com.pk/thumbnails/199731567-400x300.webp",
              Discount: "10,000",
              author: "Adnan",
              userName: userName,
              userEmail:userEmail),
        ],
      )),
    );
  }
}
