// // ignore_for_file: file_names

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:news_app/Page/Favourit.dart';
// import 'package:news_app/Page/HomeScreen/Headlines.dart';
// import 'package:news_app/Page/HomeScreen/TopStories.dart';
// import 'package:news_app/Page/Profile.dart';
// import 'package:news_app/Page/Search.dart';
// import 'dart:convert';


// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     var vwidth = MediaQuery.of(context).size.width;
//     var vhight = MediaQuery.of(context).size.height;
//     var UserData;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               'Lovely Mian',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             actions: const <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(
//                   right: 22,
//                 ),
//                 child: Icon(Icons.search),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   right: 22,
//                 ),
//                 child: Icon(Icons.more_vert),
//               ),
//             ],
//             // backgroundColor: Colors.green[800],
//             bottom: TabBar(
//                 unselectedLabelColor: Colors.white60,
//                 labelColor: Colors.white,
//                 indicatorColor: Colors.white,
//                 tabs: const [
//                   Tab(
//                       child: Text(
//                     'Headlines',
//                     // style: TextStyle(
//                     //   fontWeight: FontWeight.bold,
//                     // ),
//                   )),
//                   Tab(
//                     child: Text(
//                       'Favourit',
//                       // style: TextStyle(
//                       //   fontWeight: FontWeight.bold,
//                       // ),
//                     ),
//                   ),
//                   Tab(
//                     child: Text(
//                       'Favourit',
//                       // style: TextStyle(
//                       //   fontWeight: FontWeight.bold,
//                       // ),
//                     ),
//                   ),
//                 ]),
//           ),
         
//           body:Column( 
//             children:  [
//               TabBarView(children: [
//                 TopStories(),
//                 Headlines(),
//                 Favourit(Login: UserData)
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
 
//   }
// }



