import 'package:test_app/models/song.dart';

import 'album.dart';

class Track extends Song {

  final String albumName;

  Track({required this.albumName, required super.name, required super.creator});

}