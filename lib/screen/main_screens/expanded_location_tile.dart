import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;

class ExpandedTile extends StatelessWidget {
  static const routeName = '/expandedTile';

  final String title;
  final String description;
  final String firstImgUrl;
  final String secondImgUrl;
  final String thirdImgUrl;
  final int time;
  final String imgTag;
  final double originLat;
  final double originLong;
  final double destLat;
  final double destLong;
  const ExpandedTile({
    required this.title,
    required this.description,
    required this.firstImgUrl,
    required this.secondImgUrl,
    required this.thirdImgUrl,
    required this.time,
    required this.imgTag,
    required this.originLat,
    required this.originLong,
    required this.destLat,
    required this.destLong,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: imgTag,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.elliptical(37.5, 30),
                            bottomRight: Radius.elliptical(37.5, 30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ]),
                      child: ClipRRect(
                        child: ImageSlideshow(
                          height: 300,
                          width: double.infinity,
                          initialPage: 0,
                          children: [
                            Image(
                                image: NetworkImage(firstImgUrl),
                                fit: BoxFit.cover),
                            Image(
                                image: NetworkImage(secondImgUrl),
                                fit: BoxFit.cover),
                            Image(
                                image: NetworkImage(thirdImgUrl),
                                fit: BoxFit.cover),
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.elliptical(37.5, 30),
                          bottomRight: Radius.elliptical(37.5, 30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 15,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.green,
                          size: 35.0,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Text(description, textAlign: TextAlign.left),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: Container(
                  width: size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ]),
                  child: FlutterMap(
                    options: MapOptions(
                        screenSize: size,
                        center: latLng.LatLng(destLat, destLong),
                        zoom: 13.0),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/edonmorina/ckuy0otn93uqz18o6biad5wud/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZWRvbm1vcmluYSIsImEiOiJja3V4em9vbnQwNzh1MnFsZDNycnZ5YnFlIn0.XvwmBl5-tsRJDl6ZGO0udQ',
                          additionalOptions: {
                            'accessToken':
                                'pk.eyJ1IjoiZWRvbm1vcmluYSIsImEiOiJja3V4em9vbnQwNzh1MnFsZDNycnZ5YnFlIn0.XvwmBl5-tsRJDl6ZGO0udQ',
                            'id': 'mapbox.mapbox-streets-v8',
                          }),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                              point: latLng.LatLng(originLat, originLong),
                              builder: (context) =>
                                  const Icon(Icons.pin_drop_outlined)),
                          Marker(
                              point: latLng.LatLng(destLat, destLong),
                              builder: (context) =>
                                  const Icon(Icons.pin_drop_rounded)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
