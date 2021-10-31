// ignore_for_file: file_names, avoid_print

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';


class SportsNews extends StatefulWidget {
      final Map UserData;
  const SportsNews({Key? key, required this.UserData}) : super(key: key);

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  var Date;
late String userEmail = "";
late String userName ="";

  String _title(dynamic source) {
    return source['title'].toString();
  }
  String _author(dynamic source) {
    return source['author'].toString();
  }
  String _description(dynamic source) {
    return source['description'].toString();
  }
  String _time(dynamic source) {
    return source['publishedAt'].toString();
  }
  String _url(dynamic source) {
    return source['url'].toString();
  }
  String _content(dynamic source) {
    return source['content'].toString();
  }
  String _name(dynamic source) {
    return source["source"]['name'].toString();
  }
  String _id(dynamic source) {
    return source["source"]['id'].toString();
  }


  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    var dt = DateTime.now();
    var newFormat = DateFormat("yy-MM-dd");
    String updatedDt = newFormat.format(dt);
      final String apiUrl ="https://newsapi.org/v2/top-headlines?from=$updatedDt&category=sports&sortBy=publishedAt&pageSize=10&apiKey=279ff2d9334747f980557d5520f7a04f";
      // "https://newsapi.org/v2/everything?q=tesla&from=2021-08-29&sortBy=publishedAt&apiKey=279ff2d9334747f980557d5520f7a04f";
      // Top headlines from TechCrunch right now
      // "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=279ff2d9334747f980557d5520f7a04f";

  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    // print("================================================");
    // print(json.decode(result.body)["articles"]);
    return json.decode(result.body)["articles"];
  }

    print(updatedDt); // 20-04-03
    // var addDt = DateTime.now();
    // print(addDt.add(Duration(days: 5, hours: 5, minutes: 30)));
    // var subDt = DateTime.now().subtract(Duration(days: 10, hours: 10));
    // print(addDt.isBefore(subDt)); // tr
    return MaterialApp(
            debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: fetchUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(snapshot.data.length, (index) {
                  if (widget.UserData != null) {
                    String userEmail = widget.UserData['email'];
                    String userName = widget.UserData['Name'];
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Showfullnews(
                            img: "${snapshot.data[index]['urlToImage']}",
                            titel: _title(snapshot.data[index]),
                            description: _description(snapshot.data[index]),
                            time: _time(snapshot.data[index]),
                            content: _content(snapshot.data[index]),
                            id: _id(snapshot.data[index]),
                            name: _name(snapshot.data[index]),
                            url: _url(snapshot.data[index]),
                            author: _author(snapshot.data[index]),
                            userEmail: userEmail,
                            userName: userName,
                          ),
                         ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: vwidth / 2.2,
                            height: vwidth / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${snapshot.data[index]['urlToImage']}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              _title(snapshot.data[index]),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(1.0),
                          //   child: Text(
                          //     _description(snapshot.data[index]),
                          //     overflow: TextOverflow.ellipsis,
                          //       maxLines: 3,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
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
