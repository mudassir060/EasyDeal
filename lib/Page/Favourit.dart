// ignore_for_file: file_names
import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Favourit extends StatefulWidget {
  final Map UserData;
  const Favourit({Key? key, required this.UserData}) : super(key: key);

  @override
  _FavouritState createState() => _FavouritState();
}

class _FavouritState extends State<Favourit> {
  @override
  Widget build(BuildContext context) {
    final String apiUrl =
        // "https://newsapi.org/v2/everything?q=tesla&from=2021-08-29&sortBy=publishedAt&apiKey=279ff2d9334747f980557d5520f7a04f";
        // Top headlines from TechCrunch right now
        "https://news-node-app.herokuapp.com/favouriteitem/favouriteitemget/${widget.UserData['email']}";

    Future<List<dynamic>> fetchUsers() async {
      print("=====================fetchUsers===========================");
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print("======================fetchUsers==========================");
      print(result);
      print(json.decode(result.body)["data"]);
      return json.decode(result.body)["data"];
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
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
                      userName: snapshot.data[index]['userEmail'],
                      userEmail: snapshot.data[index]['Titel']);
                }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
