import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:renta/screens/splash_page.dart';
import 'package:renta/screens/time_location.dart';

class Single extends StatefulWidget {
  var id, model, color, carName, image, serviceName, pack, category;

  Single(
      {this.category,
      this.id,
      this.model,
      this.color,
      this.carName,
      this.serviceName,
      this.image,
      this.pack});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     blurRadius: 10.0,
                    //     spreadRadius: 0.0,
                    //     offset:
                    //         Offset(2.0, 2.0), // shadow direction: bottom right
                    //   )
                    // ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                    )),
                child: Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            // color: Colors.black26,
                            ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
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
                                      color: Color(0xFF1B6A65),
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.black,
                                    size: 28,
                                  )),
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18.0,
                        left: 20,
                        // right: MediaQuery.of(context).size.width * 0.1
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.carName.toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35)),
                            Text(widget.category.toString().toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Image.network(
                        widget.image.toString(),
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.contain,
                        // height: 11,
                      ),
                      // ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // crossAxisAl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPricePerPeriod(
                        context,
                        "5 hours",
                        "${widget.pack[0]["hours5"]} PKR",
                        "first",
                        "first",
                      ),
                      buildPricePerPeriod(context, "10 hours",
                          "${widget.pack[0]["hours10"]} PKR", "sec", "sec"),
                      buildPricePerPeriod(context, "24 hours",
                          "${widget.pack[0]["hours24"]} PKR", "third", "third"),
                      buildPricePerPeriod(context, "out Of City",
                          "${widget.pack[0]["outOfCity"]} PKR", "four", "four"),
                      buildPricePerPeriod(context, "weekly",
                          "${widget.pack[0]["weekly"]} PKR", "five", "five"),
                      buildPricePerPeriod(context, "monthly",
                          "${widget.pack[0]["monthly"]} PKR", "six", "six"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // crossAxisAl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSpecificationCar("Color", "White / Black", false),
                      buildSpecificationCar("Condition", "10 / 10", true),
                      buildSpecificationCar("Gearbox", "Auto / Manual", false),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Time_location(
                                img: widget.image,
                                pack: daysss.toString(),
                                car1: widget.carName,
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
                                const TextSpan(
                                  text: 'Book this Car',
                                  style: TextStyle(
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
  String selected = "";
  Widget buildPricePerPeriod(
    BuildContext context,
    String months,
    String price,
    String onColor,
    String klor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = onColor;
          });
          // selected = false;
          daysss = months;
          print("This package is selected: $daysss");
          pricefinal = price;
          print("Package is selected $pricefinal");
          Fluttertoast.showToast(
              msg: "Package is selected $daysss \n $pricefinal",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Color(0xFF1B6A65),
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.27,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: selected == '$klor' ? Color(0xFF1B6A65) : Colors.white,
            // selected ? kPrimaryColor :
            //  color:   klor,

            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            // border: Border.all(
            //     color: Color(0xFF1B6A65),
            //     // width: selected ? 0 : 1,
            //     ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.4),
            //     spreadRadius: 3,
            //     blurRadius: 4,
            //     offset: Offset(0, 3), // changes position of shadow
            //   ),
            // ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                months.toUpperCase(),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color:
                      // selected ? Colors.white :
                      selected == '$klor' ? Colors.white : Colors.black,
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  letterSpacing: 1,
                  color:
                      // selected ? Colors.white :
                      selected == '$klor' ? Colors.white : Colors.black,
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// bool star = false;

Widget buildSpecificationCar(String title, String data, bool star) {
  return Container(
    width: 150,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        const Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 16,
    ),
    margin: const EdgeInsets.only(right: 16),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          star
              ? Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                )
              : Text("")
        ]),
  );
}
