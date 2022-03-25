import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renta/screens/services_provider.dart';
import 'package:renta/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color orangeColors = Color(0xFF1B6A65);
Color orangeLightColors = Color(0xFF1B6A65);

class SplashPage extends StatefulWidget {
  const SplashPage({key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getval_Data().whenComplete(() async {
      Timer(const Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    finalEmail == null ? SplashPage2() : ServicesProvider()));
      });
    });
    // TODO: implement initState
    super.initState();
  }

  Future getval_Data() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtaindemail = sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtaindemail;
    });
    print("finalEmail123" + finalEmail.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset(
            "assets/images/rentalogo.png",
            height: 50,
          ),
        ),
      ),
    );
  }
}
