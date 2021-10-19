import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String? itemName;
  final IconData? icon;
  final void Function()? goTo;

  const MenuItem({this.itemName, this.icon, this.goTo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: goTo,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              itemName ?? 'itemName',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
