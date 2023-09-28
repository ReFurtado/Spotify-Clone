import 'package:flutter/material.dart';
import 'artist.dart';


class ArtistRepository {
  static List<Artist> table = [
    Artist(
      id: 1,
      photo: 'assets/thisis1.jpg',
      color: Colors.white,
      colorAppBar: Colors.yellowAccent,
      title: 'This is Dua Lipa',
      info: 'The essential tracks, all in one playlist.',
      music: 'Dance The Night',
      photoList: 'assets/dualipa.jpg',
    ),
  ];
}
