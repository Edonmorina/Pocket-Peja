import 'package:flutter/material.dart';
import 'package:pocket_peja/widgets/location_widgets/location_list.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  static const routeName = '/locationScreen';
  static const menuRoute = 'locationScreen';

  // ignore: prefer_typing_uninitialized_variables
  final drawerController;
  const LocationScreen(this.drawerController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => drawerController.toggle(),
          child: const Icon(
            Icons.menu_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Pocket Peja',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(17.5),
        child: LocationList(),
      ),
    );
  }
}
