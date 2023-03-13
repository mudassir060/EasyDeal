// ignore_for_file: unnecessary_const, unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:easydeals/Api/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();
  String UID = '';
  bool isCheck = false;
  var selectedDate;
  var selectedTime;
  bool NoData = false;
  File? image;
  var UserProfile =
      "https://media.istockphoto.com/vectors/profile-placeholder-image-gray-silhouette-no-photo-vector-id1016744034?b=1&k=6&m=1016744034&s=612x612&w=0&h=dbicqM9p31ex5Lm-FpsdOjHkPZM_6Lmkb02qJO9SY5E=";
  Future pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      // Capture a photo
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageName = File(image.path);

      setState(() => this.image = imageName);
    } on PlatformException catch (error) {
      print("Failed to pick image: $error");
    }
  }

  Future uploadImage() async {
    if (image == null) return print("Please Upload Any Image");

    final imageName = File(image!.path);

    final destination = 'files/$imageName';
    // FirebaseApi.uploadFile(destination, image!);
  }

  @override
  Widget build(BuildContext context) {
    void register() async {
      final String username = usernamecontroller.text;
      final String useremail = useremailcontroller.text;
      final String PhoneNo = phonenocontroller.text;
      final String userpassword = userpasswordcontroller.text;
      try {
        if (username != null ||
            useremail != null ||
            PhoneNo != null ||
            userpassword != null) {
          const String apiUrl =
              "https://news-node-app.herokuapp.com/auth/signUp";
          Future<List<dynamic>> fetchUsers() async {
            var result = await http.post(Uri.parse(apiUrl), body: {
              "email": useremail,
              "password": userpassword,
              "Name": username,
              "phoneNo": PhoneNo,
            });
            if ("Email already Registered" ==
                json.decode(result.body)['message']) {
              Fluttertoast.showToast(
                msg: "Email already Registered",
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 3,
              );
            }
            if ("Data Not Stored Successfully" ==
                json.decode(result.body)['message']) {
              Fluttertoast.showToast(
                msg: "Try Again",
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 3,
              );
            }
            if ("User SignUp Successfully" ==
                json.decode(result.body)['message']) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            }
            // print(json.decode(result.body[0]));
            return json.decode(result.body);
          }

          fetchUsers();
        } else {
          print(
              "Name: $username Email: $useremail Password: $userpassword Phone No: $PhoneNo");
          setState(() {
            NoData = true;
          });
        }
      } catch (e) {
        print("Error ==============>$e");
        Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 3,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
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
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${UserProfile}"),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextField(
                          controller: usernamecontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Username",
                            labelText: "User Name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: useremailcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            labelText: "Email",
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextField(
                          controller: phonenocontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Phone Number",
                              labelText: "Phone Number"),
                        ),
                        const SizedBox(height: 10),
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

                        NoData == true
                            ? const Text(
                                "Please fill all requirement",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              )
                            : Container(),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: register,
                          child: const Text(
                            'Registration',
                            // style: TextStyle(fontSize: 10.0),
                          ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
