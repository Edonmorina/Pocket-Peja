import 'package:flutter/material.dart';
import 'package:pocket_peja/provider_data.dart';
import 'package:pocket_peja/screen/main_screens/location_screen.dart';
import 'package:pocket_peja/screen/main_screens/test.dart';
import 'package:provider/provider.dart';

class MultiScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final drawerController;

  const MultiScreen(this.drawerController);

  // Go to provider_data.dart file to make a new [void] function that has the same name as the route

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<Data>(context).screenChange) {
      case LocationScreen.menuRoute:
        return LocationScreen(drawerController);
      case Test.menuRoute:
        return Test(drawerController);
      default:
        return LocationScreen(drawerController);
    }
  }
}
