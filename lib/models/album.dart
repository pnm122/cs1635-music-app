import 'package:test_app/models/track.dart';
import 'package:test_app/models/artist.dart';

class Album {

  final String name;
  List<Track> tracks;
  final String artistName;
  final String art;

  Album({required this.name, required this.tracks, required this.artistName, required this.art});

}