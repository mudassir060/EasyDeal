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
  final String content;
  final String id;
  final String name;
  final String url;
  final String userName;
  final String userEmail;

  const Showfullnews(
      {Key? key,
      required this.img,
      required this.titel,
      required this.description,
      required this.time,
      required this.author,
      required this.content,
      required this.id,
      required this.name,
      required this.url,
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
        "id": id,
        "name": name,
        "author": author,
        "title": titel,
        "description": description,
        "url": url,
        "urlToImage": img,
        "publishedAt": time,
        "content": content
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
    print("id        " + id);
    print("name        " + name);
    print("author        " + author);
    print("titel        " + titel);
    print("description    " + description);
    print("url        " + url);
    print("img        " + img);
    print("time        " + time);
    print("content    " + content);
    var dfd = content.split("Image caption,");
    String Imagecaption = content;
    if(content  !=  null){
    if (dfd.length < 2) {
      print("noting found");
    } else {
      var content2 = dfd[dfd.length - 1].split("\n");
      // print("content2     " + content2[content2.length - 2]);
      Imagecaption = content2[content2.length - 2];
      print("Imagecaption" + Imagecaption);
    }
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: vwidth / 0.2,
                  height: vwidth / 1.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${img}"), fit: BoxFit.cover),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                Container(
                  width: vwidth,
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      Imagecaption,
                      style: const TextStyle(fontSize: 20),
                    ),
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
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    content,
                    // style: const TextStyle(
                    // fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
