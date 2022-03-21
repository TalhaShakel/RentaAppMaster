import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:renta/screens/register.dart';
import 'package:renta/screens/splash_page.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  TextEditingController emailcont = TextEditingController();
  @override
  void dispose() {
    emailcont.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailcont,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    hintText: 'abc@gmail.com',
                    hintStyle: const TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    resetpass();
                  },
                  child: Text("Reset password"))
            ],
          ),
        ),
      ),
    );
  }

  resetpass() async {
    try {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcont.text.trim());
      Fluttertoast.showToast(
          msg: "password reset email sent  ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: orangeColors,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: orangeColors,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
