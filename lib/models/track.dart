import 'package:test_app/models/song.dart';

import 'album.dart';

class Track extends Song {

  final Album album;

  Track({required this.album, required super.name, required super.creator, required super.covers});

}