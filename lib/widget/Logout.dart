// ignore_for_file: file_names, non_constant_identifier_names

import 'package:easydeals/Api/login.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({ Key? key }) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
    Logout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Logout();
    return const Center(child: Text("Logout..."));
  }
}