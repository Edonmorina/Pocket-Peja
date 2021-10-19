import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String avatarName; //John William
  final NetworkImage avatarImage; //

  const Avatar({
    Key? key,
    required this.avatarName,
    this.avatarImage = const NetworkImage(
        'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg'),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 40; // 40
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                  backgroundImage: avatarImage, maxRadius: avatarRadius),
            ),
          ],
        ),
        Text(
          avatarName,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ],
    );
  }
}
