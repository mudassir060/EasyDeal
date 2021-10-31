// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Map UserData;

  const ProfilePage({
    Key? key,
 required this.UserData,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Map data = {};
  String Name = "Null";
  String Email = "Null";
  String photoUrl =
      "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1214428300?k=6&m=1214428300&s=170667a&w=0&h=hMQs-822xLWFz66z3Xfd8vPog333rNFHU6Q_kc9Sues=";
  String PhoneNo = "03XX-XXXXXXX";
  String About = "I am Muslim";

  @override
  Widget build(BuildContext context) {
    double maxWidth = 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Scaffold(
            // appBar: AppBar(
            //   centerTitle: true,
            //   leading: IconButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       icon: const Icon(
            //         Icons.arrow_back,
            //       )),
            //   title: Text('Profile'),
            // ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${widget.UserData["UserProfile"]}"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Center(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // // // // // // // // // // // // // // // // // // // Name // // // // // // // // // // // // // // // // // //
                                Data(
                                    icon: Icons.person,
                                    titel: "Name",
                                    subtitel: widget.UserData['Name']),
                                Line(),
                                // // // // // // // // // // // // // // // // // // // Email // // // // // // // // // // // // // // // // // //
                                Data(
                                    icon: Icons.email,
                                    titel: "Email",
                                    subtitel: widget.UserData['email']),
                                Line(),
                                // // // // // // // // // // // // // // // // // // // Phone Number // // // // // // // // // // // // // // // // // //
                                Data(
                                    icon: Icons.phone,
                                    titel: "Phone Number",
                                    subtitel: widget.UserData['phoneNo']),
                                Line(),
                                // // // // // // // // // // // // // // // // // // // About // // // // // // // // // // // // // // // // // //
                                const Data(
                                    icon: Icons.info,
                                    titel: "About",
                                    subtitel: "Bio"),
                                Line(),
                                // // // // // // // // // // // // // // // // // // //  // // // // // // // // // // // // // // // // // //
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(
                          'Logged In with Email',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          height: 1,
          color: Colors.black12),
    );
  }
}

class Data extends StatefulWidget {
  final IconData icon;
  final String titel;
  final String subtitel;
  const Data({
    Key? key,
    required this.icon,
    required this.titel,
    required this.subtitel,
  }) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.blue,
          size: 40,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titel,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  widget.subtitel,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
