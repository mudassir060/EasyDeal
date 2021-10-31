// ignore_for_file: file_names

import 'package:flutter/material.dart';


Widget SlideList(String img, String titel) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          height: 240,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                titel,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 17,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.0, top: 5),
              child: Text("5.0 (23 Reviews)"),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget list(var img, var titel, var review, var size) {
  /*24 is for notification bar on Android*/
  final double itemHeight = (size.height) / 2.4;
  final double itemWidth = size.width / 1.6;
  var imgHeight = itemHeight /2.2;
  var imgwidth = itemWidth /6;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Popular Items",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(onPressed: () {}, child: Text("View More"))
          ],
        ),
      ),
      GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: List.generate(titel.length, (index) {
          return Container(
              margin: const EdgeInsets.all(2),
              child: Padding(
                padding: const EdgeInsets.only(right: 2.0, left: 2.0, top: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, spreadRadius: 3),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              // height: 100,
                              // width: 130,
                              height: imgHeight,
                              width: itemWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(img[index]),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                          ),
                          Text(
                            titel[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
                            ],
                          ),
                          Text(review[0]),
                        ],
                      ),
                    ),
                  ),
                  // )
                ),
              ));
        }),
      ),
    ],
  );
}
