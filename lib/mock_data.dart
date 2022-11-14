// This serves as a place to store mock data that ViewModels can use

import 'package:test_app/models/artist.dart';
import 'package:test_app/models/profile.dart';

import 'models/album.dart';
import 'models/track.dart';
import 'models/user.dart';


List<Artist> _artists = List.from(
    [
      Artist(
        name: "Coldplay",
        image: "https://cdns-images.dzcdn.net/images/artist/e65d62ecd00b8bf1ba89073943ac62a1/500x500.jpg"
      ),
      Artist(
        name: "\"Weird Al\" Yankovic",
        image: "https://www.lyrics.my/images/artist/1620/original.jpg"
      ),
      Artist(
          name: "Michael Jackson",
          image: "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkyMjkwNTI2MDAxNjM2NTg4/michael-jackson-gettyimages-89446104.jpg"
      ),
      Artist(
          name: "Foo Fighters",
          image: "https://images.sk-static.com/images/media/img/col4/20210824-165102-896968.jpg"
      ),
    ]
);

List<Album> _albums = List.from(
  [
    Album(name: "The Blue Room", tracks: [], artist: _artists.where((x) => x.name == "Coldplay").first, art: "https://upload.wikimedia.org/wikipedia/en/a/a4/Blue_room_ep.jpg"),
  ]
);

List<Track> _tracks = List.from(
  [
    Track(
      name: "Bigger Stronger",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      album: _albums.where((x) => x.name == "The Blue Room").first,
    ),
    Track(
      name: "Don't Panic",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      album: _albums.where((x) => x.name == "The Blue Room").first,
    ),
    Track(
      name: "See You Soon",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      album: _albums.where((x) => x.name == "The Blue Room").first,
    ),
    Track(
      name: "High Speed",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      album: _albums.where((x) => x.name == "The Blue Room").first,
    ),
    Track(
      name: "Such a Rush",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      album: _albums.where((x) => x.name == "The Blue Room").first,
    ),
  ]
);

User user0 = User(
    name: "Sean Dyche",
    followers: List.empty(),
    following: List.empty(),
    posts: List.empty(),
    image: "https://i2-prod.mirror.co.uk/incoming/article23403859.ece/ALTERNATES/s1200c/1_Sean-Dyche-file-photo.jpg",
    profile: Profile(
        bio: "I'm into folktronica and indie cloud rap.",
        favoriteSong: _tracks.where((x) => x.name == "See You Soon").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "The Blue Room").first,
    )
);

class MockData {

  List<Artist> get artists => _artists;

}