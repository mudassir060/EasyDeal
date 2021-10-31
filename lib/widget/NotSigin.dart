// ignore_for_file: file_names

import 'package:easydeals/Api/login.dart';
import 'package:flutter/material.dart';


class NotSigin extends StatelessWidget {
  const NotSigin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const Text(
                      "you using this app without login.\nif you want to continue.\nPlease login",
                                            textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text(
                        'LogIn',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: (){ Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Login(),
                                      ),
                                    );},
                    ),
                  ],
                ),
      ),);
  }
}