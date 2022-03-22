import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
  'https://rentastorage.blob.core.windows.net/rentacarimages-nobg/4.jpg',
  'https://rentastorage.blob.core.windows.net/rentacarimages-nobg/1.jpg',
  'https://rentastorage.blob.core.windows.net/rentacarimages-nobg/2.jpg',
  'https://rentastorage.blob.core.windows.net/rentacarimages-nobg/3.jpg',
];


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ), items: imageSliders,
      ),
    );
  }
}
