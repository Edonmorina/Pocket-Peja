import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pocket_peja/screen/menu/menu_screen.dart';
import 'package:provider/provider.dart';
import '../../provider_data.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainScreen';
  static final drawerController = ZoomDrawerController();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Widget mainScreens = Provider.of<Data>(context, listen: false).screens;

    return Scaffold(
        body: ZoomDrawer(
      style: DrawerStyle.Style1,
      controller: MainScreen.drawerController,
      menuScreen: MenuScreen(),
      mainScreen: mainScreens,
      borderRadius: 24.0,
      showShadow: true,
      angle: -3,
      backgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width * .5,
      openCurve: Curves.fastLinearToSlowEaseIn,
      closeCurve: Curves.bounceIn,
    ));
  }
}
