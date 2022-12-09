import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.imageURL, this.radius = 16});
  final String imageURL;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: radius,
      backgroundImage: imageURL == "" ? null : NetworkImage(imageURL),
      child: imageURL == "" ? const Icon(Icons.person, size: 16) : null,
    );
  }
}