import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pocket_peja/controller/get_location.dart';
import 'package:pocket_peja/screen/menu/main_screen.dart';
import 'package:pocket_peja/screen/menu/multi_screen.dart';
import 'screen/main_screens/location_screen.dart';
import 'screen/main_screens/test.dart';

class Data extends ChangeNotifier {
  // Location
  GetLocation currentLocation = GetLocation();
  double latitude = 1;
  double longitude = 1;
  Future<void> getLocation() async {
    print('Get Location started...');
    await currentLocation.getCurrenctLocation();
    latitude = currentLocation.latitude;
    print(latitude);
    longitude = currentLocation.longitude;
    print(longitude);
    print('Got Location...');

    notifyListeners();
  }
  //

  // SCREENS

  MultiScreen screens = MultiScreen(MainScreen.drawerController);
  // Default screen
  String screenChange = LocationScreen.menuRoute;

  void goLocationScreen() {
    screenChange = LocationScreen.menuRoute;
    notifyListeners();
  }

  void goTestScreen() {
    screenChange = Test.menuRoute;
    notifyListeners();
  }
  //

  // Parallex Effect on Images
  late PageController pageController;
  double pageOffset = 0;
//
}
