// ignore_for_file: avoid_print, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:easydeals/Api/login.dart';
import 'package:easydeals/Page/CartScreen.dart';
import 'package:easydeals/Page/Favourit.dart';
import 'package:easydeals/Page/Home.dart';
import 'package:easydeals/Page/HomeScreen/Cars.dart';
import 'package:easydeals/Page/HomeScreen/Clothes.dart';
import 'package:easydeals/Page/HomeScreen/Electronics.dart';
import 'package:easydeals/Page/HomeScreen/Mobile.dart';
import 'package:easydeals/Page/Profile.dart';
import 'package:easydeals/Page/Search.dart';
import 'package:easydeals/widget/Logout.dart';
import 'package:easydeals/widget/NotSigin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  final Map UserData;

  // ignore: non_constant_identifier_names
  HomePage({required this.UserData});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  var Navigatio = 0;
  int _selectedIndex = 0;
  var appBarTitleText = const Center(child: Text("Easy Deal"));
  @override
  Widget build(BuildContext context) {
    _openPopup(context) {
      String _search = '';
      // Alert(
      //     context: context,
      //     title: "Search",
      //     content: Column(
      //       children: <Widget>[
      //         TextField(
      //           decoration: InputDecoration(
      //             icon: Icon(Icons.account_circle),
      //             labelText: 'Search',
      //           ),
      //           onChanged: (text) {
      //             setState(() {
      //               _search = text;
      //             });
      //           },
      //         ),
      //       ],
      //     ),
      //     buttons: [
      //       DialogButton(
      //         onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => Search(Text: _search),
      //           ),
      //         ),
      //         child: Text(
      //           "Search",
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         ),
      //       )
      //     ]).show();
    }

    print('+++++++++++++++++++++++++++++++++++++');
    print(
        "{============================================================>${widget.UserData}}");
    final Page = [
      HomePage(
        UserData: widget.UserData,
      ),
      widget.UserData == null
          ? NotSigin()
          : ProfilePage(UserData: widget.UserData),
      widget.UserData == null
          ? NotSigin()
          : Favourit(UserData: widget.UserData),
      widget.UserData == null
          ? NotSigin()
          : CartScreen(UserData: widget.UserData),
      widget.UserData == null ? Login() : Logout(),
    ];
    String apiUrl = "";

    widget.UserData != null
        ? apiUrl =
            // http://localhost:5000/Cart/Cartget/mudassirmukhtar4@gmail.com
            "https://news-node-app.herokuapp.com/Cart/Cartget/${widget.UserData['email']}"
        : null;
    Future<String> fetchBill() async {
      print("=====================fetchUsers===========================");
      var result = await http.post(
        Uri.parse(apiUrl),
      );
      print(
          "======================fetchcartData======================= ===${json.decode(result.body)["Index"]}");
      return json.decode(result.body)["Index"].toString();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EasyDeal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.greenAccent,
                          Colors.green,
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                  SafeArea(
                      child: Container(
                    width: 200.0,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DrawerHeader(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('images/Logo1.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            widget.UserData == null
                                ? TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ),
                                      );
                                    },
                                    child: Text("Login",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)))
                                : Text(
                                    widget.UserData['Name'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                          ],
                        )),
                        Expanded(
                            child: ListView(
                          children: [
                            ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                  value = 0;
                                  appBarTitleText =
                                      const Center(child: Text("Home"));
                                });
                              },
                              leading:
                                  const Icon(Icons.home, color: Colors.white),
                              title: const Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                  value = 0;
                                  appBarTitleText =
                                      const Center(child: Text("Profile"));
                                });
                              },
                              leading:
                                  const Icon(Icons.person, color: Colors.white),
                              title: const Text(
                                'Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 2;
                                  value = 0;
                                  appBarTitleText =
                                      const Center(child: Text("Favourit"));
                                });
                              },
                              leading: const Icon(Icons.favorite,
                                  color: Colors.white),
                              title: const Text(
                                'Favourit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 3;
                                  value = 0;
                                  appBarTitleText =
                                      const Center(child: Text("Cart"));
                                });
                              },
                              leading: const Icon(Icons.shopping_cart,
                                  color: Colors.white),
                              title: const Text(
                                'Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 4;
                                  value = 0;
                                  appBarTitleText =
                                      const Center(child: Text("Logout"));
                                });
                              },
                              leading:
                                  const Icon(Icons.logout, color: Colors.white),
                              title: widget.UserData == null
                                  ? const Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : const Text(
                                      'Logout',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  )),
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: value),
                      duration: const Duration(microseconds: 500),
                      curve: Curves.easeInExpo,
                      builder: (_, double val, __) {
                        return (Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..setEntry(0, 3, 200 * val),
                          // // ..rotateY((pi / 6) * val),
                          child: DefaultTabController(
                            length: 4,
                            child: Scaffold(
                              appBar: AppBar(
                                  title: appBarTitleText,
                                  actions: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 0.0),
                                        child: IconButton(
                                          onPressed: () {
                                            _openPopup(context);
                                          },
                                          icon: Icon(
                                            Icons.search,
                                            size: 26.0,
                                          ),
                                        )),
                                    FutureBuilder(
                                        future: fetchBill(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 7),
                                              child: Stack(children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartScreen(
                                                                  UserData: widget
                                                                      .UserData),
                                                        ));
                                                  },
                                                  icon: Icon(
                                                    Icons.shopping_cart,
                                                    size: 26,
                                                  ),
                                                ),
                                                int.parse(snapshot.data
                                                            .toString()) >=
                                                        1
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 25,
                                                                top: 0),
                                                        child: Container(
                                                          height: 13,
                                                          width: 13,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                snapshot.data
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                      )
                                                    : Container()
                                              ]),
                                            );
                                          }
                                          return Container(
                                            width: 0.0,
                                            height: 0.0,
                                          );
                                        }),
                                  ],
                                  leading: IconButton(
                                    icon: const Icon(Icons.menu),
                                    tooltip: 'Main Menu',
                                    onPressed: () {
                                      if (value == 0) {
                                        setState(() {
                                          value = 1;
                                        });
                                      } else {
                                        setState(() {
                                          value = 0;
                                        });
                                      }
                                      print(value);
                                    },
                                  ),
                                  bottom: _selectedIndex == 0
                                      ? const TabBar(
                                          unselectedLabelColor: Colors.white60,
                                          labelColor: Colors.white,
                                          indicatorColor: Colors.white,
                                          tabs: [
                                              Tab(
                                                  child: Text(
                                                'Electronics',
                                              )),
                                              Tab(
                                                child: Text(
                                                  'Cars',
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  'Mobile',
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  'Clothes',
                                                ),
                                              ),
                                            ])
                                      : null),
                              body: _selectedIndex == 0
                                  ? TabBarView(children: [
                                      Home(
                                          UserData: widget.UserData,
                                          Categories: "Electronics"),
                                      Home(
                                          UserData: widget.UserData,
                                          Categories: "Cars"),
                                      Home(
                                          UserData: widget.UserData,
                                          Categories: "Mobile"),
                                      Home(
                                          UserData: widget.UserData,
                                          Categories: "Clothes"),
                                    ])
                                  : Page[_selectedIndex],
                            ),
                          ),
                        ));
                      }),
                  GestureDetector(
                    onHorizontalDragUpdate: (e) {
                      // print(e.delta.dx);
                      if (e.delta.dx > 0) {
                        setState(() {
                          value = 1;
                        });
                      } else {
                        setState(() {
                          value = 0;
                        });
                      }
                      print(value);
                    },
                    // onTap: () {
                    //   setState(() {
                    //     value == 0 ? value = 1 : value = 0;
                    //   });
                    // },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
