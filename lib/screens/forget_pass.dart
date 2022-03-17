import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renta/screens/login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Color(0xFF1B6A65),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              height: height * 0.15,
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.15),
              height: height * 0.85,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ListView(
                children: [
                  SizedBox(height: height * 0.08),
                  Text(
                    'reset password'.toUpperCase(),
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: Container(
                      height: 1,
                      width: width * 0.8,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your Email * ",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.all(12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Center(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                    decoration: BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.green, Colors.green]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                              blurRadius: 4,
                              color: const Color(0xFF1B6A65),
                              )
                        ]),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Reset',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const login(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
