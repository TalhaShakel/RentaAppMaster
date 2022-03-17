// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:renta/components/main_drawer.dart';
import 'services_provider.dart';
import 'register.dart';
import 'splash_page.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
}

bool _isObscure = true;

class _loginState extends State<login> {
  bool valuefirst = false;
  bool valuesecond = false;
  TextEditingController logemail = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  void geti() async {
    //   var pagl;
    //   final user = FirebaseAuth.instance.currentUser;
    //   final userCredentials = await FirebaseFirestore.instance
    //       .collection("Service")
    //       .doc(user.uid)
    //       .get();

    //   pagl = userCredentials.data()["email"];

    //   print(pagl);
    // }
    // userStore() async {
    //   FirebaseFirestore db = FirebaseFirestore.instance;
    //   String uid = await auth.currentUser.uid;

    //   try {
    //     await db.collection("Service").doc(uid).set({
    //       "name": name.text,
    //       "email": email.text,
    //       "phone": phone.text,
    //       "password": pass.text,
    //       "service": _mySelection,
    //       "cnic": cnic.text,
    //       "location": await location.toString()
    //     });
    //     print("User is register");
    //   } catch (e) {
    //     print("ERROR");
    //   }
    // }

    signin() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: logemail.text, password: pass.text);

        Fluttertoast.showToast(
            msg: "Login Successfull ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: orangeColors,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ServicesProvider()));
      } catch (e) {
        print("ERROR $e");
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [orangeColors, orangeLightColors],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
              // ignore: prefer_const_constructors
              // image: DecorationImage(
              //   image: AssetImage("assets/images/back.jpeg"),
              //   fit: BoxFit.contain,
              // ),
            ),
          ),
        ),
        Positioned(
            top: 100,
            left: 50,
            right: 50,
            child: Container(
              height: 440,
              width: 420,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [orangeColors, orangeLightColors],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                borderRadius: BorderRadius.circular(25),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 25.0,
                  ),
                ],
              ),

              // key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/rentalogo.png",
                        height: 130, width: 250),
                    // Container(
                    //     height: 25,
                    //     width: 300,
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //           colors: [orangeColors, orangeLightColors],
                    //           end: Alignment.bottomCenter,
                    //           begin: Alignment.topCenter),
                    //     ),
                    //     // color:  [orangeColors, orangeLightColors],
                    //     child:
                    //      Padding(
                    //       padding: const EdgeInsets.only(left: 30),
                    //       child: Text(
                    //         "Please Login To Your Account",
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white),
                    //       ),
                    //     )
                    //     ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 8, left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: logemail,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'abc@gmail.com',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 4, left: 10, right: 10),
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: pass,
                        obscureText: _isObscure,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintText: '****',
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 40,
                    //   width: 400,
                    //   color: Colors.white,
                    //   child: Row(
                    //     // ignore: prefer_const_literals_to_create_immutables
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 2),
                    //         child: Text(
                    //           "Cbx",
                    //           style: TextStyle(
                    //             color: Colors.green[800],
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 8),
                    //         child: Text(
                    //           "Rmemember me?",
                    //           style: TextStyle(
                    //             color: Colors.green[800],
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 70),
                    //         child: Text(
                    //           "Forgot Password?",
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.green[800],
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 8),
                      child: Container(
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [orangeColors, orangeLightColors],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter)),
                        child: ElevatedButton(
                          onPressed: () async {
                            curretndata();
                            await signin();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[600]),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(25),
                            // ),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius:
                            //       BorderRadius.circular(12), // <-- Radius
                            // ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => register()));
                        },
                        child: Container(
                          height: 20,
                          width: 400,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [orangeColors, orangeLightColors],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter)),
                          child: Center(
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 1),
                                  child: Text(
                                    "Do not have Account?",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  // ignore: unnecessary_const
                                  child: const Text(
                                    "Signup",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
            )),
      ]),
    );
  }
}
