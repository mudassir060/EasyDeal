// // ignore: file_names
// // ignore_for_file: avoid_web_libraries_in_flutter, file_names

// import 'dart:convert';

// import 'package:easydeals/widget/Showfullnews.dart';
// import 'package:easydeals/widget/item.dart';
// import 'package:flutter/material.dart';

// class Electronics extends StatefulWidget {
//   final Map UserData;
//   const Electronics({Key? key, required this.UserData}) : super(key: key);

//   @override
//   _ElectronicsState createState() => _ElectronicsState();
// }

// String userName = "null";
// String userEmail = "null";

// class _ElectronicsState extends State<Electronics> {
//   @override
//   Widget build(BuildContext context) {
//     var vwidth = MediaQuery.of(context).size.width;
//     if (widget.UserData != null) {
//       print("=========================jjjjjj==============dg===========>${userEmail}");
//       userEmail = widget.UserData['email'];
//       userName = widget.UserData['Name'];
//     }
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'EasyDeal',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: Scaffold(
//           body: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: (1 / 1.2),
//         children: [
//           item(
//               Titel: "Casio laser Projector XJV2",
//               Price: "185000",
//               Rating: 3,
//               Description:
//                   """4K 3000 Lumens Hybrid Laser LED Lamp Free Projector having 24/7 operation. 
// best for indoor advertisement 
// indoor Brands Advertising
// best for Home Cinemas
// best for Presentations
// best for outlet display 

// Warranty 01 year
// No need to replace lamp again n again
// Just buy and enjoy laser Projection
// Quick on/off

// Call us
// Smart One Technologies
// Pakistan
// Suite 14, 6th floor, Al Hafeez Shopping Mall, Main Boulevard Gulberg III, Lahore
// O321 4O8 6763""",
//               Img:
//                   "https://images.olx.com.pk/thumbnails/102895761-400x300.webp",
//               Discount: "1034",
//               author: "SmartOne Technologies",
//               userName: userName,
//               userEmail:userEmail),
//           item(
//               Titel:
//                   "Combo deal 4gb/64gb Tanix Tx6s Android Tv Box With Keyboard/Mouse",
//               Price: "5499",
//               Rating: 2,
//               Description:
//                   """Most Awaited Octa Core DDR 4 Tv Box With Android 10 Sab Se Behter Or Powerful Box Now Available For Sale , Octa Core with Warranty
// Eid Offer Device + Keyboard/Mouse
// Very Elegant n Strong Device
// Free Movies/Series, (Netflix,Amazon,Zee5,Pak,Asian,English etc)""",
//               Img:
//                   "https://images.olx.com.pk/thumbnails/172238453-400x300.webp",
//               Discount: "1404",
//               author: "Mudassir",
//               userName: userName,
//               userEmail:userEmail),
//           item(
//               Titel: "Electrical Goods, Electric Equipment",
//               Price: "400",
//               Rating: 5,
//               Description:
//                   """Panasonic 1-chip DLP projectors are brighter and better than ever with a compilation of numerous Panasonic proprietary technologies. The wide-aspect PT-D6000US with a brightness of 6500 lumens produces vivid colorful images with the aid of the newly engineered RGB Booster. The Dual-Lamp System makes sure that presentations aren't interrupted even if a lamp suddenly burns out. This is joined by the Auto Cleaning Filter, which makes filter cleaning unnecessary for approximately 10,000 hours, for high reliability. It offers easy and flexible system configuration.""",
//               Img:
//                   "https://images.olx.com.pk/thumbnails/179644938-400x300.webp",
//               Discount: "160,000",
//               author: "Projector point",
//               userName: userName,
//               userEmail:userEmail),
//           item(
//               Titel: "Electrical Goods, Electric Equipment",
//               Price: "150000",
//               Rating: 3,
//               Description: "Description",
//               Img:
//                   "https://3.imimg.com/data3/AB/YM/MY-2785260/all-electrical-goods-500x500.jpg",
//               Discount: "444",
//               author: "Mudassir",
//               userName: userName,
//               userEmail:userEmail),
//         ],
//       )),
//     );
//   }
// }
