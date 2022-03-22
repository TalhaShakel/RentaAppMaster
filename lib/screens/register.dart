import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:renta/screens/login.dart';

import '../widgets/btn_widget.dart';
import 'splash_page.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class register extends StatefulWidget {
  // const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController repasswordcontroller = TextEditingController();
TextEditingController fullnamecontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController phoneNumbercontroller = TextEditingController();
// userStore() async {}


class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    registerfirebase() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        FirebaseFirestore db = FirebaseFirestore.instance;

        String? uid = auth.currentUser?.uid;

        try {
          await db.collection("users").doc(uid).set({
            "name": fullnamecontroller.text,
            "email": emailcontroller.text,
            "phone": phoneNumbercontroller.text,
            "password": passwordcontroller.text,
            "repassword": repasswordcontroller.text,
            "username": usernamecontroller.text,
          });
          print("User is register");
        } catch (e) {
          print("$uid");
          Fluttertoast.showToast(
              msg: "$e",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        Fluttertoast.showToast(
            msg: "Register Successfull",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login()));

        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'weak-password') {
        //     print('The password provided is too weak.');
        //   } else if (e.code == 'email-already-in-use') {
        //     print('The account already exists for that email.');
        //   }
      } catch (e) {
        print("Error $e");
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emailcontroller.clear();
      passwordcontroller.clear();
      phoneNumbercontroller.clear();
      usernamecontroller.clear();
      repasswordcontroller.clear();
      fullnamecontroller.clear();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: orangeColors,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: new Color(0xFF1B6A65),
                  gradient: LinearGradient(
                    colors: [(new Color(0xFF1B6A65)), new Color(0xFF1B6A65)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "assets/images/rentalogo.png",
                        height: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )
                  ],
                )),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: fullnamecontroller,
                  cursorColor: const Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Full Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Full Name is required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: usernamecontroller,
                  cursorColor: Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.verified_user_sharp,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "username",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffEEEEEE),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneNumbercontroller,
                  cursorColor: Color(0xFF1B6A65),
                  decoration: InputDecoration(
                    focusColor: Color(0xFF1B6A65),
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Phone Number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Number is required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffEEEEEE),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xFF1B6A65),
                  decoration: InputDecoration(
                    focusColor: Color(0xFF1B6A65),
                    icon: Icon(
                      Icons.email,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    }
                    // if (!emailValidatorRegExp.hasMatch(value)) {
                    //   return 'Enter a valid email';
                    // }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffEEEEEE),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  onChanged: (value) {},
                  cursorColor: Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    focusColor: Color(0xFF1B6A65),
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Enter Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffEEEEEE),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 100,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: repasswordcontroller,
                  obscureText: true,
                  onChanged: (value) {},
                  cursorColor: Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    focusColor: Color(0xFF1B6A65),
                    // ignore: unnecessary_const
                    icon: const Icon(
                      Icons.vpn_key,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Re-type Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter password again!";
                    }
                    if (passwordcontroller.text != value) {
                      return "Password does not match!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3.0, bottom: 8),
                child: Container(
                  child: ButtonWidget(
                    onClick: () async {
                      try {
                        registerfirebase();
                      } catch (e) {
                        print(e);
                      }
                    },
                    //MaterialPageRoute(builder: (context) => Showroom()));

                    btnText: "Register",
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => register()));
              //     },
              // child: Container(
              //   height: 20,
              //   width: 400,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [orangeColors, orangeLightColors],
              //           end: Alignment.bottomCenter,
              //           begin: Alignment.topCenter)),
              //   child: Center(
              //     child: Row(
              //       // ignore: prefer_const_literals_to_create_immutables
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 1),
              //           child: Text(
              //             "Do not have Account?",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 14,
              //             ),
              //           ),
              //         ),
              //         Spacer(),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 6),
              //           child: Text(
              //             "Signup",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 14,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              //   ),
              // ),
            ],
          ),
        )));
  }
}
