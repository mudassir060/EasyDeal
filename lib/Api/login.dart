// ignore_for_file: non_constant_identifier_names

import 'package:easydeals/Api/register.dart';
import 'package:easydeals/widget/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String Name = '';
  String Email = '';
  String PhoneNo = '';
  String UID = '';
  String UserProfile = '';
  bool looding = false;
  final TextEditingController useremailcontroller =
      TextEditingController(text: "abc@gmail.com");
  final TextEditingController userpasswordcontroller =
      TextEditingController(text: "qwerty");

  void register() async {
    Map? UserData = {};
    final String useremail = useremailcontroller.text;
    final String userpassword = userpasswordcontroller.text;
    setState(() {
      looding = true;
    });
    try {
      print(
          '=========================User is Login...=============================');
      final String apiUrl = "https://news-node-app.herokuapp.com/auth/signin";
      Future<List<dynamic>> fetchUsers() async {
        var result = await http.post(Uri.parse(apiUrl), body: {
          "email": useremail,
          "password": userpassword,
        });
        print(
            "===================Get data form mongodb =============================");
        print(json.decode(result.body));
        setState(() {
          looding = false;
        });
        if ("NOt User is registered with this Email" ==
            json.decode(result.body)['message']) {
         Fluttertoast.showToast(
          msg: "User Not Found",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
        );  }
        if ("Your Password is incorrect" ==
            json.decode(result.body)['message']) {
          Fluttertoast.showToast(
            msg: "Your Password is incorrect",
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 3,
          );
        }
        if ("Your are signin successfully" ==
            json.decode(result.body)['message']) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomePage(UserData: json.decode(result.body)['result']),
            ),
          );
        }

        return json.decode(result.body);
      }

      fetchUsers();
    } catch (e) {
      setState(() {
        looding = false;
      });
      Fluttertoast.showToast(
        msg: e.toString(),
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4,
      );
    }
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initstate() {
    super.initState();
    register();
  }

  @override
  Widget build(BuildContext context) {
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign in',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: vwidth,
            height: vhight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                children: [
                  looding
                      ? const Positioned(
                          child: Center(child: CircularProgressIndicator()))
                      : Center(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 220,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('images/Logo.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // // // // // // // // // // Email input // // // // // // // // //
                            TextField(
                              controller: useremailcontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText: "Email"),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: userpasswordcontroller,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    // color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    _toggle();
                                  },
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forget Password',
                                      style: TextStyle(fontSize: 10.0),
                                    )),
                              ],
                            ),
                            // SizedBox(height: 10),
                            ElevatedButton(
                              child: const Text(
                                'LogIn',
                                // style: TextStyle(fontSize: 10.0),
                              ),
                              onPressed: register,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              child: const Text(
                                'Continue without login',
                                // style: TextStyle(fontSize: 10.0),
                              ),
                              onPressed: () {
                                var UserData;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(UserData: UserData),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Registration(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Don't have an account? Sign up",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
