// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Showfullnews extends StatefulWidget {
  final String img;
  final String titel;
  final String description;
  final String publishedAt;
  final String author;
  final String Price;
  final String Discount;
  final String Rating;
  final Map UserData;
  const Showfullnews(
      {Key? key,
      required this.img,
      required this.titel,
      required this.description,
      required this.publishedAt,
      required this.author,
      required this.Price,
      required this.Discount,
      required this.Rating,
      required this.UserData})
      : super(key: key);

  @override
  _ShowfullnewsState createState() => _ShowfullnewsState();
}

class _ShowfullnewsState extends State<Showfullnews> {
  @override
  bool looding = false;
  var NoOfItems = '0';
  var TotelPrice = 0;
  String userName = "null";
  String userEmail = "null";

  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    const String apiUrl =
        "https://news-node-app.herokuapp.com/favouriteitem/favouriteitemadd";
    // "https://news-node-app.herokuapp.com/favouritenews/favouritenewsadd";
    Future<List<dynamic>> AddToFavourite() async {
      setState(() {
        looding = true;
      });
      print("================$looding=============================>>>>>>");
      var result = await http.post(Uri.parse(apiUrl), body: {
        "Titel": widget.titel,
        "Price": widget.Price,
        "Rating": widget.Rating,
        "Description": widget.description,
        "Img": widget.img,
        "Discount": widget.Discount,
        "author": widget.author,
        "userName": userName,
        "userEmail": userEmail,
        "publishedAt": "21/02/2013"
      });
      print(
          "===================Get data form mongodb =============================");
      print(json.decode(result.body)["message"]);
      Fluttertoast.showToast(
        msg: json.decode(result.body)["message"],
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
      );
      setState(() {
        looding = false;
      });
      // print(json.decode(result.body[0]));
      return json.decode(result.body);
    }

    Future<List<dynamic>> AddToCart() async {
      setState(() {
        looding = true;
      });
      final String apiUrl = "https://news-node-app.herokuapp.com/Cart/Cartadd";
      print("=============================================>>>>>>");
      var result = await http.post(Uri.parse(apiUrl), body: {
        "Titel": widget.titel,
        "Price": widget.Price,
        "Rating": widget.Rating,
        "NoOfItems": NoOfItems,
        "Description": widget.description,
        "Img": widget.img,
        "Discount": widget.Discount,
        "author": widget.author,
        "userName": userName,
        "userEmail": userEmail,
        "publishedAt": "21/02/2013"
      });
      print(
          "===================Get data form mongodb =============================");
      print(json.decode(result.body)["message"]);
      Fluttertoast.showToast(
        msg: json.decode(result.body)["message"],
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
      );
      setState(() {
        looding = false;
      });
      // print(json.decode(result.body[0]));
      return json.decode(result.body);
    }

    print(
        "===================Get data form List news =============================");
    print("author        " + widget.author);
    print("titel        " + widget.titel);
    print("description    " + widget.description);
    print("img        " + widget.img);
    print("time        " + widget.publishedAt);
    print("time        " + widget.Rating);
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: vwidth / 0.2,
                            height: vwidth / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(widget.img),
                                  fit: BoxFit.cover),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: userEmail != "null"
                                      ? IconButton(
                                          onPressed: () {
                                            AddToFavourite();
                                          },
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 44,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("No of Items"),
                              DropdownButton<String>(
                                value: NoOfItems,
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    NoOfItems = newValue!;
                                  });
                                },
                                items: <String>[
                                  '0',
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9',
                                  '10',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              ElevatedButton(
                                child: const Text(
                                  'Add Cart',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                onPressed: userEmail != "null"
                                    ? AddToCart
                                    : null,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              widget.titel,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Row(
                              children: [
                                Text(
                                  widget.publishedAt,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                      width: 2,
                                      height: 15,
                                      color: Colors.black),
                                ),
                                Text(
                                  widget.author,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              widget.description,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            child: const Text(
                              'Add Cart',
                              // style: TextStyle(fontSize: 10.0),
                            ),
                            onPressed: userEmail == "null"
                                ? AddToCart
                                : null,
                          ),
                        ],
                      ),
                      looding
                          ? const SizedBox(
                              height: 400,
                              child: Positioned(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            )
                          : const Center(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
