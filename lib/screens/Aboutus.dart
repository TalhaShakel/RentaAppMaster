import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("About Us"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                """
- Customer can have their own petrol filling , we don't steal money from you pockets we
  believe in customers care. There is huge commission which is snatching by the other
  rental app on fuel .
- 30 min Delivery time inshallah .
- Minimum prices, cheapest then others.
- Unique Car which are not even available in karachi.
- No High fares , No Hidden charges
- We provide Decoration on cars , which you booked.
  we are providing Escort services and Security Guard For you
- Discounted Deal will be provided.
- Uniformed Drivers , No slang languages by driver, No spitting by driver , No Smoking in
  car by driver.
- Refreshments in luxury cars .
- Driver will be very much obliged to the customers .
- The car is delivered right to you, so no time is wasted.
- When you are done with the car, you can leave the driver at any place or location,
- You won’t need to fill lengthy paperwork , So click and Car which You booked will be at
  Your doorsteps
- All you need is 4 taps, and the entire booking of a car is handled on the mobile phone.
- Many car to fit within your budget and Your personality
- We provide services 24/7, so you have your car whenever you need it.
- Once you rent a car, you can easily extend the days you need it for, providing flexibility"""
                    .trimLeft(),
                style: TextStyle(
                    color: Colors.black, fontSize: 13, letterSpacing: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
