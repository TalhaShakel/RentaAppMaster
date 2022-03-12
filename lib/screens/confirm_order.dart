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

        // "forWedding": wedyes ? "Yes" : "No",
      });
      Fluttertoast.showToast(
          msg: "Your Order is place $pagl",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
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
        title: Text("My Bookings Details"),
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
                  ///Fuel Charges:  All other Cars are from Same Level of Fuel to Same Level of Fuel
                  ///Important note:
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
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)), // Set rounded corner radius

                        border: Border.all(
                          color: Color(0xFF1B6A65),
                          width: 4,
                        )),
                    child: Column(
                      children: [
                        Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          """1-With Driver 
2-No fuel Commissions &Without Fuel
3-No High-fares No HiddenCharges.""",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              letterSpacing: 1, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                            color: Color(0xFF1B6A65),
                            width: 4,
                          )),
                      child: Column(
                        children: [
                          Text(
                            "IMPORTANT NOTE",
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            """Rental Charges only Valid for Karachi CITY. 
Add On Charges will be applied for Extra Per Hour
1-Sedan = 250
2- Hatch Back = 200
3- Luxury & SUV= 500""",
                            style: TextStyle(
                                letterSpacing: 1, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Rental charges are only valid for within Karachi City. Rs.500/HOUR will be charged for an extra hour in HalfDAY Rental Rs.200/HOUR will be charged for an extra hour in FULL-DAY Rental.",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                            color: Color(0xFF1B6A65),
                            width: 4,
                          )),
                      child: Column(
                        children: [
                          Text(
                            "ORDER SUMMARY",
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            """Package: $pack2
Price: $price
Delivery Date: ${selectedDate}
Address: ${address} """,
                            style: TextStyle(
                                letterSpacing: 1, fontWeight: FontWeight.bold),
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
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Place Order',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    // recognizer: TapGestureRecognizer()
                                    // onTap = () {
                                    // print("months");
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       postdata();
                  //     },
                  //     child: Text("Post"))
                ]),
          ),
        ),
      ),
    );
  }
}
