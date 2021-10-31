// ignore_for_file: unnecessary_const

import 'package:easydeals/Api/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController useremailcontroller = TextEditingController();
    final TextEditingController phonenocontroller = TextEditingController();
    final TextEditingController biocontroller = TextEditingController();
    final TextEditingController otpcontroller = TextEditingController();
    final TextEditingController userpasswordcontroller =
        TextEditingController();
    String UID = '';
  var UserProfile =
      "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=";
  @override
  Widget build(BuildContext context) {
    void register() async {
      final String username = usernamecontroller.text;
      final String useremail = useremailcontroller.text;
      final String userOTP = otpcontroller.text;
      final String PhoneNo = phonenocontroller.text;
      final String Bio = biocontroller.text;
      final String userpassword = userpasswordcontroller.text;
      try {
        final String apiUrl = "https://news-node-app.herokuapp.com/auth/signUp";
        Future<List<dynamic>> fetchUsers() async {
          var result = await http.post(Uri.parse(apiUrl), body: {
            "email": useremail,
            "password": userpassword,
            "Name": username,
            "phoneNo": PhoneNo,
          });
          print(
              "===================Get data form mongodb =============================");
          print(json.decode(result.body));
                  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
          // print(json.decode(result.body[0]));
          return json.decode(result.body);
        }
        fetchUsers();
      } catch (e) {
        print("Error ==============>$e");
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(); // dismiss dialog
          },
        );
        AlertDialog alert = AlertDialog(
          title: Center(child: Text("Error")),
          content: Text("$e"),
          actions: [
            okButton,
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
      // print([username, useremail, userpassword]);
    }

    // print("===============Oter===========>$UserProfile");
    var vwidth = MediaQuery.of(context).size.width;
    var vhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Welcome to Arya Solutions'),
        // ),
        body: SingleChildScrollView(
          child: Container(
            width: vwidth,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.black12,
                        borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                        )),
                    constraints: BoxConstraints(maxWidth: 600),
                    // width: 360,
                    // height: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15),
                        child: Container(
                          child: Column(
                            children: [
                              // SizedBox(height: 30),
                              // Text(
                              //   'Welcome to LinkedUp',
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
                              // +++++++++++++++++++++++++++++++++++++++Logo Image+++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

                              const SizedBox(height: 20),
                              TextField(
                                controller: usernamecontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Username",
                                  labelText: "User Name",
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextField(
                                controller: useremailcontroller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Email",
                                  labelText: "Email",
                                ),
                              ),
                              
                              SizedBox(height: 15),
                              TextField(
                                controller: phonenocontroller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Phone Number",
                                    labelText: "Phone Number"),
                              ),
                             const SizedBox(height: 15),
                              TextField(
                                controller: userpasswordcontroller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Password"),
                              ),
                              // FlutterPasswordStrength(
                              //     password: userpasswordcontroller.text,
                              //     strengthCallback: (strength) {
                              //       debugPrint(strength.toString());
                              //     }),

                              SizedBox(height: 15),
                              TextField(
                                controller: biocontroller,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "About",
                                    labelText: "About"),
                              ),
                             const SizedBox(height: 10),
                              FlatButton(
                                onPressed: register,
                                child: const Text(
                                  'Registration',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "I have an account? Login",
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
                      ),
                    ),
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
