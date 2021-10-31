// ignore_for_file: file_names, avoid_print

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';


import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String Text;
  const Search({Key? key, required this.Text}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var Date;

  String _title(dynamic source) {
    return source['title'];
  }

  String _author(dynamic source) {
    return source['author'];
  }

  String _description(dynamic source) {
    return source['description'];
  }

  String _time(dynamic source) {
    return source['publishedAt'];
  }

  String _url(dynamic source) {
    return source['url'];
  }

  String _content(dynamic source) {
    return source['content'];
  }

  String _name(dynamic source) {
    return source['name'];
  }

  String _id(dynamic source) {
    return source["source"]['id'];
  }

  @override
  Widget build(BuildContext context) {
    print("======================================>>>>>");
    print(widget.Text);
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    var dt = DateTime.now();
    var newFormat = DateFormat("yy-MM-dd");
    String updatedDt = newFormat.format(dt);
    final String apiUrl =
        "https://newsapi.org/v2/top-headlines?q=${widget.Text}&apiKey=279ff2d9334747f980557d5520f7a04f";
    print(apiUrl);

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
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Showfullnews(
                      //       img: "${snapshot.data[index]['urlToImage']}",
                      //       titel: _title(snapshot.data[index]),
                      //       description: _description(snapshot.data[index]),
                      //       time: _time(snapshot.data[index]),
                      //       content: _content(snapshot.data[index]),
                      //       id: _id(snapshot.data[index]),
                      //       name: _name(snapshot.data[index]),
                      //       url: _url(snapshot.data[index]),
                      //       author: _author(snapshot.data[index]),
                      //       userEmail: 'Mudassirmukhtar4@gmail.com',
                      //       userName: 'Mudassir Mukhtar',
                      //     ),
                      //   ),
                      // );
                   
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
