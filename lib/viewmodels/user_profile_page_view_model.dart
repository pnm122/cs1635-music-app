import 'package:flutter/cupertino.dart';
import 'package:test_app/models/artist.dart';

import '../models/album.dart';
import '../models/profile.dart';
import '../models/track.dart';
import '../models/user.dart';

Artist initialFavArtist = Artist(name: "Coldplay", image: "https://cdns-images.dzcdn.net/images/artist/e65d62ecd00b8bf1ba89073943ac62a1/500x500.jpg");
Album initialAlbum = Album(
    name: 'The Blue Room',
    tracks: [],
    artist: initialFavArtist,
    art: 'https://upload.wikimedia.org/wikipedia/en/a/a4/Blue_room_ep.jpg');

Album initialAlbum2 = Album(
    name: 'Parachutes',
    tracks: [],
    artist: initialFavArtist,
    art: 'https://upload.wikimedia.org/wikipedia/en/f/fd/Coldplay_-_Parachutes.png');

Track initialTrack = Track(album: initialAlbum, name: 'See You Soon', creator: initialFavArtist,);

Profile initialProfile = Profile(
  bio: "I'm into folktronica and indie cloud rap.",
  favoriteSong: initialTrack,
  favoriteArtist: initialFavArtist,
  favoriteAlbum: initialAlbum2
);

User initialUser = User(
  name: "Sean Dyche",
  followers: List.empty(),
  following: List.empty(),
  posts: List.empty(),
  image: "https://i2-prod.mirror.co.uk/incoming/article23403859.ece/ALTERNATES/s1200c/1_Sean-Dyche-file-photo.jpg",
  profile: initialProfile
);

String countToString(int cnt) {
  String str = '';

  if (cnt >= 1000000000) {
    str += (cnt / 1000000000).toString();
    str += "B";
  } else if (cnt >= 1000000) {
    str += (cnt / 1000000).toString();
    str += "M";
  } else if (cnt >= 1000) {
    str += (cnt / 1000).toString();
    str += "K";
  } else {
    str += cnt.toString();
  }

  return str;
}

class UserProfilePageViewModel with ChangeNotifier {

  final User _user = initialUser;
  User get user => _user;

  final String _followersCnt = countToString(initialUser.followers.length);
  String get followersCnt => _followersCnt;

  final String _followingCnt = countToString(initialUser.following.length);
  String get followingCnt => _followingCnt;
}