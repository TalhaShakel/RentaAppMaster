import 'package:flutter/material.dart';

import '../widgets/btn_widget.dart';
import 'login.dart';

class SplashPage2 extends StatefulWidget {
  const SplashPage2({key}) : super(key: key);

  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [orangeColors, orangeLightColors],
            //         end: Alignment.bottomCenter,
            //         begin: Alignment.topCenter),
            //   ),
            //   child:
            SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/welcome.gif",
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.8,
                ),
                ButtonWidget(
                  btnText: "Get Started",
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                )
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => LoginPage()));
                //     },
                //     child: Text("data"))
              ],
            ),
          ),
        ));
    // );
  }
}
