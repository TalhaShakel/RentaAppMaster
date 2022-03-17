// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:renta/screens/splash_page.dart';
// import 'package:http/http.dart' as http;

// import '../screens/singleperson.dart';
// import '../widgets/slider.dart';

// class tabs extends StatefulWidget {
//   @override
//   State<tabs> createState() => _tabsState();
// }

// class _tabsState extends State<tabs> {
//   var list = [];

//   var list1 = [];

//   var list2 = [];

//   var list3 = [];

//   @override
//   void initState() {
//     sedan();
//     suv();
//     luxury();
//     hatchbag();
//     super.initState();
//   }

//   Future sedan() async {
//     final url = Uri.parse(
//         'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
//     http.Response response = await http.get(url);

//     var obj = json.decode(response.body);
//     var ss = obj['data']['cars'];
//     // print(ss);
//     var ssd = ss;
//     // print("hhh" + ssd.toString());

//     var h = ssd[0]['packages'][0]['weekly'];

//     if (response.statusCode == 200 || response.statusCode == 400) {
//       print(h.toString());

//       for (int i = 0; i < ssd.length; i++) {
//         if (ssd[i]['category'] == "sedan") {
//           list.add({
//             'id': ssd[i]['_id'],
//             'modal': ssd[i]['model'],
//             'image': ssd[i]['carImg'],
//             'carName': ssd[i]['carName'],
//             'color': ssd[i]['color'],
//             'packages': ssd[i]['packages'],
//             'category': ssd[i]['category']
//           });
//         }
//       }
//     }
//     print(list);
//     setState(() {});
//   }

//   Future luxury() async {
//     final url = Uri.parse(
//         'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
//     http.Response response = await http.get(url);

//     var obj = json.decode(response.body);
//     var ss = obj['data']['cars'];
//     // print(ss);
//     var ssd = ss;
//     // print("hhh" + ssd.toString());

//     var h = ssd[0]['packages'][0]['weekly'];

//     if (response.statusCode == 200 || response.statusCode == 400) {
//       print(h.toString());

//       for (int i = 0; i < ssd.length; i++) {
//         if (ssd[i]['category'] == "luxury") {
//           list1.add({
//             'id': ssd[i]['_id'],
//             'modal': ssd[i]['model'],
//             'image': ssd[i]['carImg'],
//             'carName': ssd[i]['carName'],
//             'color': ssd[i]['color'],
//             'packages': ssd[i]['packages'],
//             'category': ssd[i]['category']
//           });
//         }
//       }
//     }
//     print(list1);
//     setState(() {});
//   }

//   Future suv() async {
//     final url = Uri.parse(
//         'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
//     http.Response response = await http.get(url);

//     var obj = json.decode(response.body);
//     var ss = obj['data']['cars'];
//     // print(ss);
//     var ssd = ss;
//     // print("hhh" + ssd.toString());

//     var h = ssd[0]['packages'][0]['weekly'];

//     if (response.statusCode == 200 || response.statusCode == 400) {
//       print(h.toString());

//       for (int i = 0; i < ssd.length; i++) {
//         if (ssd[i]['category'] == "SUV") {
//           list2.add({
//             'id': ssd[i]['_id'],
//             'modal': ssd[i]['model'],
//             'image': ssd[i]['carImg'],
//             'carName': ssd[i]['carName'],
//             'color': ssd[i]['color'],
//             'packages': ssd[i]['packages'],
//             'category': ssd[i]['category']
//           });
//         }
//       }
//     }
//     print(list2);
//     setState(() {});
//   }

//   Future hatchbag() async {
//     final url = Uri.parse(
//         'https://rentacar1311.azurewebsites.net/api/v1/car/fetch-car');
//     http.Response response = await http.get(url);

//     var obj = json.decode(response.body);
//     var ss = obj['data']['cars'];
//     // print(ss);
//     var ssd = ss;
//     // print("hhh" + ssd.toString());

//     var h = ssd[0]['packages'][0]['weekly'];

//     if (response.statusCode == 200 || response.statusCode == 400) {
//       print(h.toString());

//       for (int i = 0; i < ssd.length; i++) {
//         if (ssd[i]['category'] == "luxury") {
//           list3.add({
//             'id': ssd[i]['_id'],
//             'modal': ssd[i]['model'],
//             'image': ssd[i]['carImg'],
//             'carName': ssd[i]['carName'],
//             'color': ssd[i]['color'],
//             'packages': ssd[i]['packages'],
//             'category': ssd[i]['category']
//           });
//         }
//       }
//     }
//     print(list3);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     var widthScreen = MediaQuery.of(context).size.width;
//     var heightScreen = MediaQuery.of(context).size.height;
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Container(
//                 height: 300,
//                 color: Colors.black,
//                 child: ComplicatedImageDemo(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 color: Colors.black,
//                 child: TabBar(
//                     indicator: BoxDecoration(color: orangeColors),
//                     tabs: [
//                       Tab(
//                         text: 'Sedan',
//                       ),
//                       Tab(
//                         text: 'SUV',
//                       ),
//                       Tab(
//                         text: 'Hatchbag',
//                       ),
//                       Tab(
//                         text: 'Luxury',
//                       )
//                     ]),
//               ),
//             ),
//             Container(
//               height: 300,
//               // color: Colors.amber,
//               child: TabBarView(children: [
//                 sedan_page(
//                     heightScreen: heightScreen,
//                     widthScreen: widthScreen,
//                     list: list),

// // page2
//                 suv_page(
//                     heightScreen: heightScreen,
//                     widthScreen: widthScreen,
//                     list1: list1),

//                 // page 3
//                 hatchbag_page(
//                     heightScreen: heightScreen,
//                     widthScreen: widthScreen,
//                     list2: list2),

//                 // page4
//                 luxury_page(
//                     heightScreen: heightScreen,
//                     widthScreen: widthScreen,
//                     list3: list3),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class luxury_page extends StatelessWidget {
//   const luxury_page({
//     Key? key,
//     required this.heightScreen,
//     required this.widthScreen,
//     required this.list3,
//   }) : super(key: key);

//   final double heightScreen;
//   final double widthScreen;
//   final List list3;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         // color: Colors.amber,
//         height: heightScreen * 0.3,
//         width: widthScreen,
//         child: list3.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: list3.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     // color: Colors.amber,
//                     height: heightScreen * 0.14,
//                     width: widthScreen * 0.5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Single(
//                                       id: list3[index]['id'],
//                                       image: list3[index]['image'],
//                                       carName: list3[index]['carName'],
//                                       model: list3[index]['modal'],
//                                       color: list3[index]['color'],
//                                       pack: list3[index]["packages"],
//                                       // serviceName: list[index]
//                                       //     ['service_name'],
//                                     )));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           color: Colors.white,
//                           elevation: 5.0,
//                           shadowColor: Colors.grey[600],
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 1),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Center(
//                                     child: Image.network(
//                                       "${list3[index]['image']}",
//                                       width: widthScreen * 0.4,
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     // mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         list3[index]['modal'],
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // Text(
//                                       //   list[index]['weekly'],
//                                       //   style: TextStyle(
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold),
//                                       // ),
//                                       Text(
//                                         list3[index]['carName'],
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 })
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }

// class hatchbag_page extends StatelessWidget {
//   const hatchbag_page({
//     Key? key,
//     required this.heightScreen,
//     required this.widthScreen,
//     required this.list2,
//   }) : super(key: key);

//   final double heightScreen;
//   final double widthScreen;
//   final List list2;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         // color: Colors.amber,
//         height: heightScreen * 0.3,
//         width: widthScreen,
//         child: list2.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: list2.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     // color: Colors.amber,
//                     height: heightScreen * 0.14,
//                     width: widthScreen * 0.5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Single(
//                                       id: list2[index]['id'],
//                                       image: list2[index]['image'],
//                                       carName: list2[index]['carName'],
//                                       model: list2[index]['modal'],
//                                       color: list2[index]['color'],
//                                       pack: list2[index]["packages"],
//                                       // serviceName: list[index]
//                                       //     ['service_name'],
//                                     )));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           color: Colors.white,
//                           elevation: 5.0,
//                           shadowColor: Colors.grey[600],
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 1),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Center(
//                                     child: Image.network(
//                                       "${list2[index]['image']}",
//                                       width: widthScreen * 0.4,
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     // mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         list2[index]['modal'],
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // Text(
//                                       //   list[index]['weekly'],
//                                       //   style: TextStyle(
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold),
//                                       // ),
//                                       Text(
//                                         list2[index]['carName'],
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 })
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }

// class suv_page extends StatelessWidget {
//   const suv_page({
//     Key? key,
//     required this.heightScreen,
//     required this.widthScreen,
//     required this.list1,
//   }) : super(key: key);

//   final double heightScreen;
//   final double widthScreen;
//   final List list1;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         // color: Colors.amber,
//         height: heightScreen * 0.3,
//         width: widthScreen,
//         child: list1.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: list1.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     // color: Colors.amber,
//                     height: heightScreen * 0.14,
//                     width: widthScreen * 0.5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Single(
//                                       id: list1[index]['id'],
//                                       image: list1[index]['image'],
//                                       carName: list1[index]['carName'],
//                                       model: list1[index]['modal'],
//                                       color: list1[index]['color'],
//                                       pack: list1[index]["packages"],
//                                       // serviceName: list[index]
//                                       //     ['service_name'],
//                                     )));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           color: Colors.white,
//                           elevation: 5.0,
//                           shadowColor: Colors.grey[600],
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 1),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Center(
//                                     child: Image.network(
//                                       "${list1[index]['image']}",
//                                       width: widthScreen * 0.4,
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     // mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         list1[index]['modal'],
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // Text(
//                                       //   list[index]['weekly'],
//                                       //   style: TextStyle(
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold),
//                                       // ),
//                                       Text(
//                                         list1[index]['carName'],
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 })
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }

// class sedan_page extends StatelessWidget {
//   const sedan_page({
//     Key? key,
//     required this.heightScreen,
//     required this.widthScreen,
//     required this.list,
//   }) : super(key: key);

//   final double heightScreen;
//   final double widthScreen;
//   final List list;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         // color: Colors.amber,
//         height: heightScreen * 0.3,
//         width: widthScreen,
//         child: list.isNotEmpty
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: list.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     // color: Colors.amber,
//                     height: heightScreen * 0.14,
//                     width: widthScreen * 0.5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Single(
//                                       id: list[index]['id'],
//                                       image: list[index]['image'],
//                                       carName: list[index]['carName'],
//                                       model: list[index]['modal'],
//                                       color: list[index]['color'],
//                                       pack: list[index]["packages"],
//                                       // serviceName: list[index]
//                                       //     ['service_name'],
//                                     )));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           color: Colors.white,
//                           elevation: 5.0,
//                           shadowColor: Colors.grey[600],
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 1),
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Center(
//                                     child: Image.network(
//                                       "${list[index]['image']}",
//                                       width: widthScreen * 0.4,
//                                     ),
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     // mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         list[index]['modal'],
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       // Text(
//                                       //   list[index]['weekly'],
//                                       //   style: TextStyle(
//                                       //       fontSize: 20,
//                                       //       fontWeight: FontWeight.bold),
//                                       // ),
//                                       Text(
//                                         list[index]['carName'],
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 })
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
