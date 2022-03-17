import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:renta/screens/splash_page.dart';

import 'time_location.dart';

class ConfirmOrder extends StatelessWidget {
  String car2;
  String address;
  String price;
  String? package;
  String pack2;
  String img;

  ConfirmOrder(
      {required this.img,
      required this.car2,
      required this.pack2,
      required this.address,
      this.package,
      required this.price});
  String url =
      "https://rentacar1311.azurewebsites.net/api/v1/order/create-order";

  postdata() async {
    var pagl;

    final user = FirebaseAuth.instance.currentUser;

    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      final userCredentials = await FirebaseFirestore.instance
          .collection("users")
          .doc(user?.uid)
          .get();

      pagl = userCredentials.data()?["email"];

      print(pagl);

      await db.collection("order").doc(user.toString()).set({
        "name": userCredentials.data()!["name"],
        "email": userCredentials.data()!["email"],
        "phone": userCredentials.data()!["phone"],
        "username": userCredentials.data()!["username"],
        "datetime": "$selectedDate",
        "carId": "$car2",
        "carColor": "White",
        "packageName": "$pack2",
        "orderedAddress": "$address",
        "time": selectedDate.toString(),
        "Day": selectedDate.day.toString(),
        "price": price.toString(),

        // "forWedding": wedyes ? "Yes" : "No",
      });
      Fluttertoast.showToast(
          msg: "Your Order have been place! $pagl",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color(0xFF1B6A65),
          textColor: Colors.white,
          fontSize: 16.0);
      // print(" ${response.body} Data is post");
    } catch (e) {
      print(e.toString());
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

  // String value;
  // ConfirmOrder(this.value, {value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A65),
        title: const Text("My Bookings Details"),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      img.toString(),
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.contain,
                      // height: 11,
                    ),
                    // ),
                  ),
                  Text(
                    car2.toString(),
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        
                      ),
                    child: Column(
                      children: [
                        const Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          """. With Driver 
. No fuel Commissions &Without Fuel
. No High-fares No HiddenCharges.""",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              letterSpacing: 1,),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          // borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                          // border: Border.all(
                          //   color: const Color(0xFF1B6A65),
                          //   width: 4,
                          // )
                        ),
                      child: Column(
                        children: [
                          const Text(
                            "IMPORTANT NOTE",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            """Rental Charges only Valid for Karachi CITY. 
Add On Charges will be applied for Extra Per Hours
1-Sedan = 250
2- Hatch Back = 200
3- Luxury & SUV= 500""",
                            style: const TextStyle(
                                letterSpacing: 1,),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: const Text(
                              "Rental charges are only valid for within Karachi City. Rs.500/HOUR will be charged for an extra hour in HalfDAY Rental Rs.200/HOUR will be charged for an extra hour in FULL-DAY Rental.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        
                        ),
                      child: Column(
                        children: [
                          const Text(
                          "ORDER SUMMARY",
                          textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            """Package: ${pack2.toUpperCase()}
Price: ${price.toUpperCase()}
Delivery Date: ${selectedDate}
Address: ${address.toUpperCase()} """,
                            style: const TextStyle(
                                letterSpacing: 1,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await postdata();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: orangeColors,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Place Order',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
