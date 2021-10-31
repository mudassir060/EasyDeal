// ignore: file_names
// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'package:easydeals/widget/Showfullnews.dart';
import 'package:flutter/material.dart';

class item extends StatefulWidget {
  final String Titel;
  final String Price;
  final int Rating;
  final String Description;
  final String Img;
  final String Discount;
  final String author;
  final String userName;
  final String userEmail;
  const item({
    Key? key,
    required this.Titel,
    required this.Price,
    required this.Rating,
    required this.Description,
    required this.Img,
    required this.Discount,
    required this.author,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<item> {
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
                    time: "20/12/2021",
                    author: widget.author,
                    Price: widget.Price,
                    Discount: widget.Discount,
                    userName: widget.userName,
                    userEmail: widget.userEmail,
                    Rating: widget.Rating.toString(),
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
      ),
    );
  }
}
