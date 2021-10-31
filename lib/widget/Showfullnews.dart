// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Showfullnews extends StatelessWidget {
  final String img;
  final String titel;
  final String description;
  final String time;
  final String author;
  final String Price;
  final String Discount;
  final String userName;
  final String userEmail;

  const Showfullnews(
      {Key? key,
      required this.img,
      required this.titel,
      required this.description,
      required this.time,
      required this.author,
      required this.Price,
      required this.Discount,
      required this.userName,
      required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    final String apiUrl =
        "https://news-node-app.herokuapp.com/favouritenews/favouritenewsadd";
    Future<List<dynamic>> fetchUsers() async {
      print("=============================================>>>>>>");
      var result = await http.post(Uri.parse(apiUrl), body: {
        "userName": userName,
        "userEmail": userEmail,
        "author": author,
        "title": titel,
        "description": description,
        "urlToImage": img,
        "publishedAt": time,
        "price": Price,
        "Discount": Discount
      });
      print(
          "===================Get data form mongodb =============================");
      print(json.decode(result.body)["message"]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(json.decode(result.body)["message"]),
          duration: const Duration(seconds: 1),
        ),
      );
      print("objectobjectobjectobject");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('snack'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'ACTION',
          onPressed: () {},
        ),
      ));
      // print(json.decode(result.body[0]));
      return json.decode(result.body);
    }

    print(
        "===================Get data form List news =============================");
    print("userName    " + userName);
    print("userEmail    " + userEmail);
    print("author        " + author);
    print("titel        " + titel);
    print("description    " + description);
    print("img        " + img);
    print("time        " + time);
 
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: vwidth / 0.2,
                    height: vwidth / 1.2,
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage("${img}"), fit: BoxFit.cover),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: IconButton(
                            onPressed: (){userEmail=="null"?fetchUsers:null;},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 44,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      titel,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                              width: 2, height: 15, color: Colors.black),
                        ),
                        Text(
                          author,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      description,
                    ),
                  ),
   
                ],
              ),
            ),
          ),
        ));
  }
}
