// ignore_for_file: avoid_print, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison, import_of_legacy_library_into_null_safe

import 'package:easydeals/Api/login.dart';
import 'package:easydeals/Page/CartScreen.dart';
import 'package:easydeals/Page/Favourit.dart';
import 'package:easydeals/Page/HomeScreen/Cars.dart';
import 'package:easydeals/Page/HomeScreen/Clothes.dart';
import 'package:easydeals/Page/HomeScreen/Electronics.dart';
import 'package:easydeals/Page/HomeScreen/Mobile.dart';
import 'package:easydeals/Page/Profile.dart';
import 'package:easydeals/Page/Search.dart';
import 'package:easydeals/widget/Logout.dart';
import 'package:easydeals/widget/NotSigin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

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
  var appBarTitleText = const Center(child: Text("PAK News"));
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
      const Logout()
    ];

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
                              leading: const Icon(Icons.card_travel,
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
                              leading: const Icon(Icons.settings,
                                  color: Colors.white),
                              title: const Text(
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
                          // ..rotateY((pi / 6) * val),
                          child: DefaultTabController(
                            length: 4,
                            child: Scaffold(
                              appBar: AppBar(
                                  title: appBarTitleText,
                                  actions: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 20.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            _openPopup(context);
                                          },
                                          child: Icon(
                                            Icons.search,
                                            size: 26.0,
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(right: 20.0),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(Icons.more_vert),
                                        )),
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
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                              Tab(
                                                child: Text(
                                                  'Cars',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  'Mobile',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Tab(
                                                child: Text(
                                                  'Clothes',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ])
                                      : null),
                              body: _selectedIndex == 0
                                  ? TabBarView(children: [
                                      Electronics(UserData: widget.UserData),
                                      Cars(UserData: widget.UserData),
                                      Mobile(UserData: widget.UserData),
                                      Clothes(UserData: widget.UserData),
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
