// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../views/album_view.dart';

class AlbumCard extends StatelessWidget {

  final ImageProvider image;
  final String label;

  AlbumCard({
    required this.image,
    required this.label,
    required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(id: 1),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [            
          Image(
            image: image,
            width: 150,
            height: 150,
            //fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: Text(
              label,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white60,
              ),
            ),
          )        
        ],
      ),
    );  
  }
}
