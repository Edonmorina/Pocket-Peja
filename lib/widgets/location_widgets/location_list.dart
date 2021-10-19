import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_peja/widgets/location_widgets/location_tile.dart';
import 'package:provider/provider.dart';
import 'package:pocket_peja/provider_data.dart';
import 'package:pocket_peja/widgets/location_widgets/keep_page_alive.dart';
import 'dart:convert';

class LocationList extends StatefulWidget {
  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  late Future<void> getLocation;

  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/tile-data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["tileList"];
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<Data>().pageController =
        PageController(viewportFraction: 0.5, keepPage: false);
    context.read<Data>().pageController.addListener(() {
      setState(() {
        context.read<Data>().pageOffset =
            context.read<Data>().pageController.page!;
      });
    });
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      controller: context.read<Data>().pageController,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return KeepAlivePage(
          child: LocationTile(
            firstImageUrl: _items[index]["firstImage"],
            secondImageUrl: _items[index]["secondImage"],
            thirdImageUrl: _items[index]["thirdImage"],
            expandableTileDescription: _items[index]["locationDescription"],
            locationName: _items[index]["locationName"],
            originLat: context.watch<Data>().latitude,
            originLong: context.watch<Data>().longitude,
            destLat: _items[index]["destLat"],
            destLong: _items[index]["destLong"],
            heroTag: index.toString(),
            offSet: index,
          ),
        );
      },
    );
  }
}
