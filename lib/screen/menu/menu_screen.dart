import 'package:flutter/material.dart';
import 'package:pocket_peja/authentication/authentication_service.dart';
import 'package:pocket_peja/screen/menu/main_screen.dart';
import 'package:pocket_peja/widgets/menu_widgets/avatar.dart';
import 'package:pocket_peja/widgets/menu_widgets/menu_items.dart';
import 'package:pocket_peja/constants/theme_colors.dart';
import 'package:provider/provider.dart';
import '../../provider_data.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MenuItem> _menuItems = [
      MenuItem(
        itemName: 'Locations',
        icon: Icons.map_rounded,
        goTo: () {
          context.read<Data>().goLocationScreen();
          MainScreen.drawerController.close!();
        },
      ),
      MenuItem(
          itemName: 'Events',
          icon: Icons.event_available_outlined,
          goTo: () {
            context.read<Data>().goTestScreen();
            MainScreen.drawerController.close!();
          }),
      MenuItem(
        itemName: 'Something',
        icon: Icons.ac_unit_rounded,
        goTo: () {},
      )
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: ThemeColors.kBackgroundColor),
        child: Column(
          children: [
            const DrawerHeader(
              child: Avatar(
                avatarName: 'John William',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: _menuItems,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: [
                  const MenuItem(
                    itemName: 'Settings',
                    icon: Icons.settings,
                  ),
                  MenuItem(
                    goTo: () {
                      context.read<AuthenticationService>().signOut();
                    },
                    itemName: 'Logout',
                    icon: Icons.logout_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
