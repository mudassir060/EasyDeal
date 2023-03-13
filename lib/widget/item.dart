// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names
import 'dart:convert';
import 'package:easydeals/Page/Favourit.dart';
import 'package:easydeals/widget/Showfullnews.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class item extends StatefulWidget {
  final String Titel;
  final String Price;
  final int Rating;
  final String Description;
  final String Img;
  final String Discount;
  final String author;
  final String id;
  final String publishedAt;
  final Map UserData;
  const item({
    Key? key,
    required this.Titel,
    required this.Price,
    required this.Rating,
    required this.Description,
    required this.Img,
    required this.Discount,
    required this.author,
    required this.publishedAt,
    required this.UserData,
    required this.id,
  }) : super(key: key);

  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {
  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    delete() async {
      final String apiUrl =
          "https://news-node-app.herokuapp.com/favouriteitem/favouriteitemdel/${widget.id}";
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print("======================fetchcartData== ========================");
      print(json.decode(result.body));
      if ("Remove Successfully" == json.decode(result.body)['message']) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Favourit(UserData: widget.UserData),
            ));
      } else {
        return Fluttertoast.showToast(
          msg: "Not Allow",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
        );
          // return Fluttertoast.showToast(
          //         msg: 'Toast Message',
          //         toastLength: Toast.LENGTH_SHORT,
          //         gravity: ToastGravity.SNACKBAR,
          //         backgroundColor: Colors.blueGrey,
          //         textColor: Colors.white,
          //         fontSize: 16.0,
          //       );
      }
      // return json.decode(result.body)["data"];
    }

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
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: vwidth / 2.2,
                  height: vwidth / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.Img), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0.5),
                  child: Text(
                    widget.Titel,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Rs. ${widget.Price}  ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                    children: <TextSpan>[
                      new TextSpan(
                        text: "Rs. ${widget.Discount}",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.star,
                    color: widget.Rating >= 1 ? Colors.yellow : Colors.black26,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.Rating >= 2 ? Colors.yellow : Colors.black26,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.Rating >= 3 ? Colors.yellow : Colors.black26,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.Rating >= 4 ? Colors.yellow : Colors.black26,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: widget.Rating >= 5 ? Colors.yellow : Colors.black26,
                    size: 15,
                  ),
                ])
              ],
            ),
            // widget.author==widget.UserData['Name']?
            Positioned(
              top: 3,
              right: 3,
              child: IconButton(
                onPressed: () {
                  delete();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 26.0,
                ),
              ),
            )
            // :Container(),
          ],
        ),
      ),
    );
  }
}
