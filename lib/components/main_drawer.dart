import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:renta/screens/login.dart';
import 'package:renta/screens/notification.dart';
import 'package:renta/screens/orders.dart';
import 'package:renta/screens/singleperson.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Aboutus.dart';
import '../screens/Profile.dart';
import '../screens/services_provider.dart';

FirebaseAuth auth = FirebaseAuth.instance;

curretndata() async {
  final userCredentials = await FirebaseFirestore.instance
      .collection("users")
      .doc(auth.currentUser?.uid)
      .get();
  name = userCredentials.data()?["name"];
  email = userCredentials.data()?["email"];
  phone = userCredentials.data()?["phone"];
  username = userCredentials.data()!["username"];
  print("object ${name + email + phone + username} ");
}

var name;

var email;

var phone;

var username;

class Main_Drawer extends StatefulWidget {
  const Main_Drawer({key}) : super(key: key);

  @override
  State<Main_Drawer> createState() => _Main_DrawerState();
}

class _Main_DrawerState extends State<Main_Drawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curretndata();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Color(0xFF1B6A65),
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://e7.pngegg.com/pngimages/643/98/png-clipart-computer-icons-avatar-mover-business-flat-design-corporate-elderly-care-microphone-heroes-thumbnail.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  '${name}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  '${auth.currentUser!.email}',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Home',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        curretndata();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesProvider(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.car_rental),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Orders',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => userOrder(),
                        //   ),
                        // );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Notifications',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => notify(),
                        //   ),
                        // );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'About us',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Aboutus(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Profile',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        curretndata();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => profile(),
                        //   ),
                        // );
                      },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 0,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.lock_open),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Logout',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove("email");
                        try {
                          FirebaseAuth auth = await FirebaseAuth.instance;
                          auth.signOut();
                          Fluttertoast.showToast(
                              msg: "Signout",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: "$e",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
