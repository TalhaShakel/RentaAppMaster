
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF1B6A65),
          title: Text(
            "About",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
      body:Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Who We Are"
                    .trimLeft(),
                style: TextStyle(
                   fontWeight: FontWeight.bold,color: Color(0xFF1B6A65),fontSize: 25, letterSpacing: 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                """
Renta is an Pakistan first car Rental service App.
Karachiites! Best offers on the cars for rental purpose. 

No need to roam around the streets to book a car as per your need.

We are just 4 clicks away. Travel without hassle. Delivery within 30 min.

Customer can have their own petrol filling , we don't steal money from you pockets we
believe in customers care. There is huge commission which is snatching by the other
rental app on fuel .

Contact Details:

Ph:+92 319 2005990
Email: info@renta.com.pk

"""
                    .trimLeft(),
                style: TextStyle(
                    color: Colors.black, fontSize: 16, letterSpacing: 1),
              ),
            ),
          ],
        ),
    );
  }
}
