// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecentlyAlbum extends StatelessWidget {
  const RecentlyAlbum({super.key, required this.image, required this.label});

  final ImageProvider image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: image,
          width: 90,
          height: 90,
          //fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
