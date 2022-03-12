import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:renta/screens/login.dart';
import 'package:renta/screens/splash_page.dart';
import 'package:renta/widgets/slider.dart';

import '../components/main_drawer.dart';
import 'singleperson.dart';

class ServicesProvider extends StatefulWidget {
  var serviceName;

  @override
  _ServicesProviderState createState() => _ServicesProviderState();
}

class _ServicesProviderState extends State<ServicesProvider> {
  var list = [];

  Future getList() async {
    final url = Uri.parse(
        'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
    http.Response response = await http.get(url);

    var obj = json.decode(response.body);
    var ss = obj['data']['cars'];
    // print(ss);
    var ssd = ss;
    // print("hhh" + ssd.toString());

    var h = ssd[0]['packages'][0]['weekly'];

    if (response.statusCode == 200 || response.statusCode == 400) {
      print(h.toString());

      for (int i = 0; i < ssd.length; i++) {
        list.add({
          'id': ssd[i]['_id'],
          'modal': ssd[i]['model'],
          'image': ssd[i]['carImg'],
          'carName': ssd[i]['carName'],
          'color': ssd[i]['color'],
          'packages': ssd[i]['packages'],
        });
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        child: Main_Drawer(),
      ),
      appBar: AppBar(
        backgroundColor: orangeColors,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 300,
                color: Colors.black,
                child: ComplicatedImageDemo(),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                // color: Colors.amber,
                height: heightScreen * 0.3,
                width: widthScreen,
                child: list.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // color: Colors.amber,
                            height: heightScreen * 0.14,
                            width: widthScreen * 0.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Single(
                                              id: list[index]['id'],
                                              image: list[index]['image'],
                                              carName: list[index]['carName'],
                                              model: list[index]['modal'],
                                              color: list[index]['color'],
                                              pack: list[index]["packages"],
                                              // serviceName: list[index]
                                              //     ['service_name'],
                                            )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5.0,
                                  shadowColor: Colors.grey[600],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Center(
                                            child: Image.network(
                                              "${list[index]['image']}",
                                              width: widthScreen * 0.4,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                list[index]['modal'],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              // Text(
                                              //   list[index]['weekly'],
                                              //   style: TextStyle(
                                              //       fontSize: 20,
                                              //       fontWeight: FontWeight.bold),
                                              // ),
                                              Text(
                                                list[index]['carName'],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
