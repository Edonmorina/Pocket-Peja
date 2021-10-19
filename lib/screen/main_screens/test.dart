import 'package:flutter/material.dart';
import 'package:pocket_peja/screen/menu/main_screen.dart';

class Test extends StatelessWidget {
  static const menuRoute = 'testScreen';

  // ignore: prefer_typing_uninitialized_variables
  final drawerController;
  const Test(this.drawerController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.menu_book_rounded),
          onTap: () {
            MainScreen.drawerController.toggle!();
          },
        ),
      ),
    );
  }
}
