// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Map UserData;
  final String Categories;
  const Home({Key? key, required this.UserData, required this.Categories})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

String userName = "null";
String userEmail = "null";

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final String apiUrl =
        "https://news-node-app.herokuapp.com/PostItems/PostItemsget/${widget.Categories}";

    Future<List<dynamic>> fetchitems() async {
      print("=====================fetchitems===========================");
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print("======================fetchitems==========================");
      print(result);
      print(json.decode(result.body)["data"]);
      return json.decode(result.body)["data"];
    }

    var vwidth = MediaQuery.of(context).size.width;
    if (widget.UserData != null) {
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
          body: FutureBuilder<List<dynamic>>(
            future: fetchitems(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.length != 0
                    ? GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1.2),
                        children: List.generate(snapshot.data.length, (index) {
                          return item(
                              Titel: snapshot.data[index]['Titel'],
                              Price: snapshot.data[index]['Price'],
                              Rating: int.parse(snapshot.data[index]['Rating']),
                              Description: snapshot.data[index]['Description'],
                              Img: snapshot.data[index]['Img'],
                              Discount: snapshot.data[index]['Discount'],
                              author: snapshot.data[index]['author'],
                              publishedAt: snapshot.data[index]['publishedAt'],
                              UserData: widget.UserData,
                              id: snapshot.data[index]['_id']);
                        }),
                      )
                    : const Center(
                        child: Text(
                        "No Data Found",
                      ));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
