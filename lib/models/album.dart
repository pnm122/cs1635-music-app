import 'package:test_app/models/track.dart';
import 'package:test_app/models/artist.dart';

class Album {

  final String name;
  final List<Track> tracks;
  final Artist artist;
  final String art;

  Album({required this.name, required this.tracks, required this.artist, required this.art});

}