import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:renta/screens/Profile.dart';
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

  var list1 = [];

  var list2 = [];

  var list3 = [];

  @override
  void initState() {
    sedan();
    suv();
    luxury();
    hatchbag();
    curretndata();
    super.initState();
  }

  Future sedan() async {
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
        if (ssd[i]['category'] == "sedan") {
          list.add({
            'id': ssd[i]['_id'],
            'modal': ssd[i]['model'],
            'image': ssd[i]['carImg'],
            'carName': ssd[i]['carName'],
            'color': ssd[i]['color'],
            'packages': ssd[i]['packages'],
            'category': ssd[i]['category']
          });
        }
      }
    }
    print(list);
    setState(() {});
  }

  Future luxury() async {
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
        if (ssd[i]['category'] == "luxury") {
          list1.add({
            'id': ssd[i]['_id'],
            'modal': ssd[i]['model'],
            'image': ssd[i]['carImg'],
            'carName': ssd[i]['carName'],
            'color': ssd[i]['color'],
            'packages': ssd[i]['packages'],
            'category': ssd[i]['category']
          });
        }
      }
    }
    print(list1);
    setState(() {});
  }

  Future suv() async {
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
        if (ssd[i]['category'] == "SUV") {
          list2.add({
            'id': ssd[i]['_id'],
            'modal': ssd[i]['model'],
            'image': ssd[i]['carImg'],
            'carName': ssd[i]['carName'],
            'color': ssd[i]['color'],
            'packages': ssd[i]['packages'],
            'category': ssd[i]['category']
          });
        }
      }
    }
    print(list2);
    setState(() {});
  }

  Future hatchbag() async {
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
        if (ssd[i]['category'] == "hatchbag") {
          list3.add({
            'id': ssd[i]['_id'],
            'modal': ssd[i]['model'],
            'image': ssd[i]['carImg'],
            'carName': ssd[i]['carName'],
            'color': ssd[i]['color'],
            'packages': ssd[i]['packages'],
            'category': ssd[i]['category']
          });
        }
      }
    }
    print(list3);
    setState(() {});
  }

  // var list = [];

  // Future getList() async {
  //   final url = Uri.parse(
  //       'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
  //   http.Response response = await http.get(url);

  //   var obj = json.decode(response.body);
  //   var ss = obj['data']['cars'];
  //   // print(ss);
  //   var ssd = ss;
  //   // print("hhh" + ssd.toString());

  //   var h = ssd[0]['packages'][0]['weekly'];
  //   for (var y = 0; y == "sedan"; y++) {
  //     print(ssd[y]['category']);
  //   }
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     print(h.toString());

  //     for (int i = 0; i < ssd.length; i++) {
  //       list.add({
  //         'id': ssd[i]['_id'],
  //         'modal': ssd[i]['model'],
  //         'image': ssd[i]['carImg'],
  //         'carName': ssd[i]['carName'],
  //         'color': ssd[i]['color'],
  //         'packages': ssd[i]['packages'],
  //         'category': ssd[i]['category']
  //       });
  //     }
  //   }

  // setState(() {});
  // }

  // @override
  // void initState() {
  // getList();
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: const Drawer(
          child: Main_Drawer(),
        ),
        appBar: AppBar(
          backgroundColor: orangeColors,
          title: Text("RENTA",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 200,
                  // color: Colors.black,
                  child: ComplicatedImageDemo(),
                ),
              ),
              GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const profile()),
                //   );
                // },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF1B6A65),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Chalo Renta Kro!",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Pakistan First Car Rental Service App",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     color: Color(0xFF1B6A65),
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular(15),
                        //     ),
                        //   ),
                        //   height: MediaQuery.of(context).size.height * 0.1,
                        //   width: 50,
                        //   child: const Center(
                        //     child: Icon(
                        //       Icons.arrow_forward_ios,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius

                      border: Border.all(
                        color: Color(0xFF1B6A65),
                        width: 2,
                      )),
                  // color: Color(0xFF1B6A65),
                  child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        color: Color(0xFF1B6A65),
                      ),
                      tabs: [
                        const Tab(
                          text: 'SEDAN',
                        ),
                        const Tab(
                          text: 'LUXURY',
                        ),
                        const Tab(
                          text: 'SUV',
                        ),
                        const Tab(
                          text: 'HATCHBAG',
                        )
                      ]),
                ),
              ),
              Container(
                height: 300,
                // color: Colors.amber,
                child: TabBarView(children: [
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
                                  height: heightScreen * 0.15,
                                  width: widthScreen * 0.5,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Single(
                                                  id: list[index]['id'],
                                                  image: list[index]['image'],
                                                  carName: list[index]
                                                      ['carName'],
                                                  model: list[index]['modal'],
                                                  color: list[index]['color'],
                                                  pack: list[index]["packages"],
                                                  category: list[index]
                                                      ['category']
                                                  // serviceName: list[index]
                                                  //     ['service_name'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // color: Colors.white,
                                        // elevation: 5.0,
                                        // shadowColor: Colors.grey[600],
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
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          ),
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
                                                      style: const TextStyle(
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
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  // page2
                  SingleChildScrollView(
                    child: Container(
                      // color: Colors.amber,
                      height: heightScreen * 0.3,
                      width: widthScreen,
                      child: list1.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: list1.length,
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
                                                  id: list1[index]['id'],
                                                  image: list1[index]['image'],
                                                  carName: list1[index]
                                                      ['carName'],
                                                  model: list1[index]['modal'],
                                                  color: list1[index]['color'],
                                                  pack: list1[index]
                                                      ["packages"],
                                                  category: list1[index]
                                                      ['category']

                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
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
                                                    "${list1[index]['image']}",
                                                    width: widthScreen * 0.4,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      list1[index]['modal'],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          ),
                                                    ),
                                                    Text(
                                                      list1[index]['carName'],
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
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
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  SingleChildScrollView(
                    child: Container(
                      height: heightScreen * 0.3,
                      width: widthScreen,
                      child: list2.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: list2.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: heightScreen * 0.14,
                                  width: widthScreen * 0.5,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Single(
                                                  id: list2[index]['id'],
                                                  image: list2[index]['image'],
                                                  carName: list2[index]
                                                      ['carName'],
                                                  model: list2[index]['modal'],
                                                  color: list2[index]['color'],
                                                  pack: list2[index]
                                                      ["packages"],
                                                  category: list2[index]
                                                      ['category']
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
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
                                                    "${list2[index]['image']}",
                                                    width: widthScreen * 0.4,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      list2[index]['modal'],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          ),
                                                    ),
                                                    Text(
                                                      list2[index]['carName'],
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
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
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  // page4
                  SingleChildScrollView(
                    child: Container(
                      // color: Colors.amber,
                      height: heightScreen * 0.3,
                      width: widthScreen,
                      child: list3.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: list3.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: heightScreen * 0.14,
                                  width: widthScreen * 0.5,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Single(
                                                  id: list3[index]['id'],
                                                  image: list3[index]['image'],
                                                  carName: list3[index]
                                                      ['carName'],
                                                  model: list3[index]['modal'],
                                                  color: list3[index]['color'],
                                                  pack: list3[index]
                                                      ["packages"],
                                                  category: list3[index]
                                                      ['category']
                                                  // serviceName: list[index]
                                                  //     ['service_name'],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // elevation: 5.0,
                                        // shadowColor: Colors.grey[600],
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
                                                    "${list3[index]['image']}",
                                                    width: widthScreen * 0.4,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      list3[index]['modal'],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          ),
                                                    ),
                                                    // Text(
                                                    //   list[index]['weekly'],
                                                    //   style: TextStyle(
                                                    //       fontSize: 20,
                                                    //       fontWeight: FontWeight.bold),
                                                    // ),
                                                    Text(
                                                      list3[index]['carName'],
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
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
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(top: 8.0),
        //         child: Container(
        //           height: 300,
        //           color: Colors.black,
        //           child: ComplicatedImageDemo(),
        //         ),
        //       ),

        //       SingleChildScrollView(
        //         child: Container(
        //           // color: Colors.amber,
        //           height: heightScreen * 0.3,
        //           width: widthScreen,
        //           child: list.isNotEmpty
        //               ? ListView.builder(
        //                   shrinkWrap: true,
        //                   scrollDirection: Axis.horizontal,
        //                   itemCount: list.length,
        //                   itemBuilder: (BuildContext context, int index) {
        //                     return Container(
        //                       // color: Colors.amber,
        //                       height: heightScreen * 0.14,
        //                       width: widthScreen * 0.5,
        //                       child: InkWell(
        //                         onTap: () {
        //                           getList();
        //                           Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (context) => Single(
        //                                         id: list[index]['id'],
        //                                         image: list[index]['image'],
        //                                         carName: list[index]['carName'],
        //                                         model: list[index]['modal'],
        //                                         color: list[index]['color'],
        //                                         pack: list[index]["packages"],
        //                                         // categ:list[index]["category"],
        //                                         // serviceName: list[index]
        //                                         //     ['service_name'],
        //                                       )));
        //                         },
        //                         child: Padding(
        //                           padding: const EdgeInsets.all(8.0),
        //                           child: Card(
        //                             color: Colors.white,
        //                             elevation: 5.0,
        //                             shadowColor: Colors.grey[600],
        //                             child: Padding(
        //                               padding: const EdgeInsets.symmetric(
        //                                   horizontal: 1),
        //                               child: SingleChildScrollView(
        //                                 child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.end,
        //                                   children: [
        //                                     Center(
        //                                       child: Image.network(
        //                                         "${list[index]['image']}",
        //                                         width: widthScreen * 0.4,
        //                                       ),
        //                                     ),
        //                                     Column(
        //                                       crossAxisAlignment:
        //                                           CrossAxisAlignment.start,
        //                                       // mainAxisAlignment: MainAxisAlignment.start,
        //                                       children: [
        //                                         Text(
        //                                           list[index]['category']
        //                                               .toString()
        //                                           // list[index]['modal']
        //                                           ,
        //                                           style: TextStyle(
        //                                               fontSize: 20,
        //                                               fontWeight:
        //                                                   FontWeight.bold),
        //                                         ),
        //                                         // Text(
        //                                         //   list[index]['weekly'],
        //                                         //   style: TextStyle(
        //                                         //       fontSize: 20,
        //                                         //       fontWeight: FontWeight.bold),
        //                                         // ),
        //                                         Text(
        //                                           list[index]['carName'],
        //                                           textAlign: TextAlign.left,
        //                                           style: TextStyle(
        //                                               fontSize: 20,
        //                                               fontWeight:
        //                                                   FontWeight.bold),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     );
        //                   })
        //               : Center(child: CircularProgressIndicator()),
        //         ),
        //       ),
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
