import 'package:easydeals/Api/register.dart';
import 'package:easydeals/widget/Navigation.dart';
import 'package:flutter/material.dart';

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

  final TextEditingController useremailcontroller = TextEditingController();
  final TextEditingController userpasswordcontroller = TextEditingController();

  void register() async {
    Map? UserData = {};
    final String useremail = useremailcontroller.text;
    final String userpassword = userpasswordcontroller.text;

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
        // print("Name"+json.decode(result.body)['result']["Name"]);
        // print("email"+json.decode(result.body)['result']["email"]);
        // print("phoneNo"+json.decode(result.body)['result']["phoneNo"]);

        // print(result.body["email"]);
        // print(json.decode(result.body[0]));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(UserData: json.decode(result.body)['result']),
          ),
        );
        return json.decode(result.body);
      }

      fetchUsers();
    } catch (e) {
      print("Error ==============>$e");
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      AlertDialog alert = AlertDialog(
        title: const Center(child: Text("Error")),
        content: Text(e.toString()),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                        )),
                    // constraints: BoxConstraints(minWidth: 100, maxWidth: 600),
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 15, right: 15),
                        child: Container(
                          // width: 300,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
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
                              SizedBox(height: 30),
                              // // // // // // // // // // Email input // // // // // // // // //
                              TextField(
                                controller: useremailcontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    hintText: "Email"),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                controller: userpasswordcontroller,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
                                      print(
                                          "===================================================$_obscureText");
                                      _toggle();
                                      print(
                                          "===================================================$_obscureText");
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
                              SizedBox(height: 20),
                              ElevatedButton(
                                child: const Text(
                                  'Continue without login',
                                  // style: TextStyle(fontSize: 10.0),
                                ),
                                onPressed: () {
                                  var UserDate;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(UserData: UserDate),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Registration(),
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
