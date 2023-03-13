// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:easydeals/Page/CartScreen.dart';
import 'package:easydeals/widget/Showfullnews.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartItem extends StatefulWidget {
  final String Titel;
  final String Price;
  final int Rating;
  final String NoOfItems;
  final String TotelPrice;
  final String Description;
  final String Img;
  final String Discount;
  final String author;
  final String publishedAt;
  final String id;
  final Map UserData;
  const CartItem({
    Key? key,
    required this.Titel,
    required this.Price,
    required this.Rating,
    required this.Description,
    required this.Img,
    required this.Discount,
    required this.author,
    required this.NoOfItems,
    required this.TotelPrice,
    required this.id,
    required this.UserData,
    required this.publishedAt,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Future<List<dynamic>>
  delete() async {
    final String apiUrl =
        "https://news-node-app.herokuapp.com/Cart/Cartdel/${widget.id}";
    print("=====================fetchUsers=== ========================");
    var result = await http.post(
      Uri.parse(apiUrl),
    );
    print("======================fetchcartData== ========================");
    print(json.decode(result.body));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartScreen(UserData: widget.UserData),
        ));
    // return json.decode(result.body)["data"];
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Showfullnews(
                    img: widget.Img,
                    titel: widget.Titel,
                    description: widget.Description,
                    publishedAt: widget.publishedAt,
                    author: widget.author,
                    Price: widget.Price,
                    Discount: widget.Discount,
                    UserData: widget.UserData,
                    Rating: widget.Rating.toString(),
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(widget.NoOfItems,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      delete();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 26.0,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: vwidth / 6,
                  height: vwidth / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.Img), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: vwidth / 1.6,
                              child: Text(
                                widget.Titel,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              width: vwidth / 1.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "RS: ${widget.Price}/-",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  // Text(
                                  //   "No of Items: ${widget.NoOfItems}",
                                  //   overflow: TextOverflow.ellipsis,
                                  //   maxLines: 1,
                                  //   style: const TextStyle(fontSize: 16),
                                  // ),
                                  // Row(children: [
                                  //   Icon(
                                  //     Icons.star,
                                  //     color: widget.Rating >= 1
                                  //         ? Colors.yellow
                                  //         : Colors.black26,
                                  //     size: 15,
                                  //   ),
                                  //   Icon(
                                  //     Icons.star,
                                  //     color: widget.Rating >= 2
                                  //         ? Colors.yellow
                                  //         : Colors.black26,
                                  //     size: 15,
                                  //   ),
                                  //   Icon(
                                  //     Icons.star,
                                  //     color: widget.Rating >= 3
                                  //         ? Colors.yellow
                                  //         : Colors.black26,
                                  //     size: 15,
                                  //   ),
                                  //   Icon(
                                  //     Icons.star,
                                  //     color: widget.Rating >= 4
                                  //         ? Colors.yellow
                                  //         : Colors.black26,
                                  //     size: 15,
                                  //   ),
                                  //   Icon(
                                  //     Icons.star,
                                  //     color: widget.Rating >= 5
                                  //         ? Colors.yellow
                                  //         : Colors.black26,
                                  //     size: 15,
                                  //   ),
                                  // ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
