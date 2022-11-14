import 'package:test_app/models/track.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/artist.dart';

class Profile {

  Track? favoriteSong;
  Album? favoriteAlbum;
  Artist? favoriteArtist;
  String bio;
  final List<Track> listeningHistory;

  Profile({this.bio = '', this.listeningHistory = const [], this.favoriteSong, this.favoriteAlbum, this.favoriteArtist});

}