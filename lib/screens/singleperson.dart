import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:renta/screens/splash_page.dart';
import 'package:renta/screens/time_location.dart';

class Single extends StatelessWidget {
  var id, model, color, carName, image, serviceName, pack;

  Single(
      {this.id,
      this.model,
      this.color,
      this.carName,
      this.serviceName,
      this.image,
      this.pack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            // color: Colors.black26,
                            ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.black,
                                    size: 28,
                                  )),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: orangeColors,
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.white,
                                      size: 22,
                                    )),
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 22,
                                    )),
                              ],
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Image.network(
                          image.toString(),
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.contain,
                          // height: 11,
                        ),
                        // ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 7.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Center(
                            child: Text(carName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildPricePerPeriod(
                      context,
                      "hours5",
                      "${pack[0]["hours5"]} PKR",
                    ),
                    buildPricePerPeriod(
                      context,
                      "hours10",
                      "${pack[0]["hours10"]} PKR",
                    ),
                    buildPricePerPeriod(
                      context,
                      "hours24",
                      "${pack[0]["hours24"]} PKR",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildPricePerPeriod(
                    context,
                    "outOfCity",
                    "${pack[0]["outOfCity"]} PKR",
                  ),
                  buildPricePerPeriod(
                    context,
                    "weekly",
                    "${pack[0]["weekly"]} PKR",
                  ),
                  buildPricePerPeriod(
                    context,
                    "monthly",
                    "${pack[0]["monthly"]} PKR",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Time_location(
                                img: image,
                                pack: daysss.toString(),
                                car1: carName,
                                price: pricefinal.toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 18.0),
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
              ),
            ],
          ),
          //   C
        ),
      ),
    ));
    // (ye nav ka secion hai)
  }

  String pricefinal = "";
  String daysss = "";
  Widget buildPricePerPeriod(
    BuildContext context,
    String months,
    String price,
  ) {
    return GestureDetector(
      onTap: () {
        // selected = false;
        daysss = months;
        print("This package is selected: $daysss");
        pricefinal = price;
        print("Package is selected $pricefinal");
        Fluttertoast.showToast(
            msg: "Package is selected $daysss \n $pricefinal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.27,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              // selected ? kPrimaryColor :
              Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(15),
          ),
          border: Border.all(
              // color: Colors.black,
              // width: selected ? 0 : 1,
              ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              months,
              style: TextStyle(
                letterSpacing: 1,
                color:
                    // selected ? Colors.white :
                    Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                letterSpacing: 1,
                color:
                    // selected ? Colors.white :
                    Colors.black,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
