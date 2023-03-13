// ignore_for_file: file_names
import 'package:easydeals/widget/CartItem.dart';
import 'package:easydeals/widget/Showfullnews.dart';
import 'package:easydeals/widget/item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartScreen extends StatefulWidget {
  final Map UserData;
  const CartScreen({Key? key, required this.UserData}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var TolelPrice = 0;
  @override
  Widget build(BuildContext context) {
    final String apiUrl =
        // http://localhost:5000/Cart/Cartget/mudassirmukhtar4@gmail.com
        "https://news-node-app.herokuapp.com/Cart/Cartget/${widget.UserData['email']}";
    Future<String> fetchBill() async {
      print("=====================fetchUsers===========================");
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print(
          "======================fetchcartData======================= ===${json.decode(result.body)["TotelBalance"]}");
      return json.decode(result.body)["TotelBalance"].toString();
    }

    Future<List<dynamic>> fetchUsers() async {
      print("=====================fetchUsers=== ========================");
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print("======================fetchcartData== ========================");
      print(json.decode(result.body));

      return json.decode(result.body)["data"];
    }

    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //                         title: Text("appBarTitleText"),
        //                         actions: <Widget>[
        //                           Padding(
        //                               padding: EdgeInsets.only(right: 20.0),
        //                               child: GestureDetector(
        //                                 onTap: () {
        //                                   // _openPopup(context);
        //                                 },
        //                                 child: Icon(
        //                                   Icons.search,
        //                                   size: 26.0,
        //                                 ),
        //                               )),
        //                           Padding(
        //                               padding: EdgeInsets.only(right: 20.0),
        //                               child: GestureDetector(
        //                                 onTap: () {},
        //                                 child: Icon(Icons.more_vert),
        //                               )),
        //                         ],),

        body: Column(
          children: [
            SizedBox(
              height: vhight - 200,
              child: FutureBuilder<List<dynamic>>(
                future: fetchUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                                    return snapshot.data.length != 0?
                     GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: (7 / 1.2),
                      children: List.generate(snapshot.data.length, (index) {
                        return CartItem(
                            Titel: snapshot.data[index]['Titel'],
                            Price: snapshot.data[index]['Price'],
                            Rating: int.parse(snapshot.data[index]['Rating']),
                            NoOfItems: snapshot.data[index]['NoOfItems'],
                            TotelPrice: snapshot.data[index]['TotelPrice:'],
                            Description: snapshot.data[index]['Description'],
                            Img: snapshot.data[index]['Img'],
                            Discount: snapshot.data[index]['Discount'],
                            publishedAt: snapshot.data[index]['publishedAt'],
                            author: snapshot.data[index]['author'],
                            UserData: widget.UserData,
                            id: snapshot.data[index]['_id']);
                      }),
                    )   : const Center(
                        child: Text(
                        "No Item added in Cart",
                      ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
              child: FutureBuilder(
                  future: fetchBill(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Total Bill:       Rs ${snapshot.data.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      );
                    }
                    return Container(
                      width: 0.0,
                      height: 0.0,
                    );
                  }),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: const Text(
                'Order Now',
                // style: TextStyle(fontSize: 10.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
