// This serves as a place to store mock data that ViewModels can use

import 'package:test_app/models/artist.dart';
import 'package:test_app/models/profile.dart';

import 'models/album.dart';
import 'models/comment.dart';
import 'models/media_post.dart';
import 'models/post.dart';
import 'models/song.dart';
import 'models/text_post.dart';
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
      Artist(
          name: "Harrison Storm",
          image: "https://twostorymelody.com/wp-content/uploads/elementor/thumbs/harrison-om5udujmsccxrn9lm0m4w3f6bm8b0z76gx4fzwcmfc.jpg"
      ),
    ]
);

List<Album> _albums = List.from(
    [
      Album(name: "The Blue Room", tracks: [
      ], artist: _artists.where((x) => x.name == "Coldplay").first, art: "https://upload.wikimedia.org/wikipedia/en/a/a4/Blue_room_ep.jpg"),
      Album(name: "Brothers & Sisters", tracks: [
      ], artist: _artists.where((x) => x.name == "Coldplay").first, art: "https://upload.wikimedia.org/wikipedia/en/8/8d/Brothers%26sisters.jpg"),
      Album(name: "Sonic Highways", tracks: [
      ], artist: _artists.where((x) => x.name == "Foo Fighters").first, art: "https://upload.wikimedia.org/wikipedia/en/6/67/Foo_Fighters_8LP_Sonic_Highways.jpg"),
      Album(name: "Sense of Home", tracks: [
      ], artist: _artists.where((x) => x.name == "Harrison Storm").first, art: "https://images.genius.com/dba6d5bf9692b5d96efd96ef48bc1670.1000x894x1.jpg"),
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
      Track(
        name: "Brothers & Sisters",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
      ),
      Track(
        name: "Easy To Please",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
      ),
      Track(
        name: "Only Superstition",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
      ),
      Track(
        name: "Something from Nothing",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "The Feast and The Famine",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "Congregation",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "What Did I Do?/God As My Witness",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "Outside",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "In The Clear",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "Subterranean",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "I Am A River",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      Track(
        name: "Sense of Home",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      Track(
        name: "Be Yourself",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      Track(
        name: "The Words You Say",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      Track(
        name: "Broken Feather",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
      ),
    ]
);



List<User> _users = List.from([
  User(
      name: "Sean Dyche",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(),
      image: "https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg",
      profile: Profile(
        bio: "ROCK ON LADS!!!",
        favoriteSong: _tracks.where((x) => x.name == "See You Soon").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sense of Home").first,
      )
  ),
  User(
      name: "Peter Crouch",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(),
      image: "https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg",
      profile: Profile(
        bio: "I'm into folktronica and indie cloud rap.",
        favoriteSong: _tracks.where((x) => x.name == "Only Superstition").first,
        favoriteArtist: _artists.where((x) => x.name == "\"Weird Al\" Yankovic").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
      )
  ),
  User(
      name: "Andy Carroll",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(),
      image: "https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg",
      profile: Profile(
        bio: "I just wanna rock out.",
        favoriteSong: _tracks.where((x) => x.name == "Broken Feather").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
      )
  ),
  User(
      name: "Steve Bruce",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(),
      image: "https://st.depositphotos.com/1269204/1219/i/600/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg",
      profile: Profile(
        bio: "Music is my escape.",
        favoriteSong: _tracks.where((x) => x.name == "Outside").first,
        favoriteArtist: _artists.where((x) => x.name == "Coldplay").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sense of Home").first,
      )
  ),
]);

List<Post> _posts = List.from([
  TextPost(
    poster: _users.where((x) => x.name == 'Steve Bruce').first,
    likedBy: [
      _users.where((x) => x.name == "Andy Carroll").first,
      _users.where((x) => x.name == "Peter Crouch").first,
      _users.where((x) => x.name == "Sean Dyche").first,
    ],
    text: 'What are yinz kids listening to these days?',
    createdTime: DateTime.utc(2019, 12, 20, 10, 19),
  ),
  TextPost(
      poster: _users.where((x) => x.name == 'Steve Bruce').first,
      likedBy: [
        _users.where((x) => x.name == "Sean Dyche").first,
      ],
      text: 'What should I listen to if I like Coldplay\'s Easy To Please?',
      createdTime: DateTime.utc(2020, 1, 31, 22, 59),
      comments: [
        Comment(
            content: "I recommend Coldplay's Bigger Stronger off of The Blue Room album.",
            commenter: _users.where((x) => x.name == "Sean Dyche").first,
            likedBy: [
              _users.where((x) => x.name == "Steve Bruce").first
            ],
            childComments: [
              Comment(
                  content: "Thanks Sean! I'll have to check it out.",
                  commenter: _users.where((x) => x.name == "Steve Bruce").first,
                  likedBy: [
                    _users.where((x) => x.name == "Sean Dyche").first
                  ]
              )
            ]
        ),
      ]
  ),
  TextPost(
      poster: _users.where((x) => x.name == "Steve Bruce").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
        _users.where((x) => x.name == "Andy Carroll").first,
      ],
      text: 'Does anyone actually still listen to Micheal Jackson?',
      createdTime: DateTime.utc(2020, 12, 3, 2, 9),
      comments: [
        Comment(
            content: "Of course!",
            commenter: _users.where((x) => x.name == "Andy Carroll").first,
            likedBy: [
              _users.where((x) => x.name == "Andy Carroll").first,
              _users.where((x) => x.name == "Sean Dyche").first,
              _users.where((x) => x.name == "Peter Crouch").first,
              _users.where((x) => x.name == "Steve Bruce").first,
            ]
        ),
      ]
  ),
  MediaPost(
      poster: _users.where((x) => x.name == "Andy Carroll").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
      ],
      text: "Here is my cover of Harrison Storm's Broken Feather",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2022, 11, 15, 9, 58),
      song: _tracks.where((x) => x.name == "Broken Feather").first)
]);

_addSongsToAlbums() {
  _albums.where((x) => x.name == "The Blue Room").first.tracks.addAll(_tracks.where((x) => x.album.name == "The Blue Room"));
  _albums.where((x) => x.name == "Brothers & Sisters").first.tracks.addAll(_tracks.where((x) => x.album.name == "Brothers & Sisters"));
  _albums.where((x) => x.name == "Sonic Highways").first.tracks.addAll(_tracks.where((x) => x.album.name == "Sonic Highways"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Sense of Home"));
}

_addFollowingFollowers() {
  _users.where((x) => x.name == "Sean Dyche").first.followers.addAll([
    _users.where((x) => x.name == "Steve Bruce").first,
    _users.where((x) => x.name == "Andy Carroll").first,
  ]);
  _users.where((x) => x.name == "Sean Dyche").first.following.addAll([
    _users.where((x) => x.name == "Steve Bruce").first,
  ]);
  _users.where((x) => x.name == "Andy Carroll").first.followers.addAll([
    _users.where((x) => x.name == "Peter Crouch").first,
  ]);
  _users.where((x) => x.name == "Andy Carroll").first.following.addAll([
    _users.where((x) => x.name == "Steve Bruce").first,
    _users.where((x) => x.name == "Peter Crouch").first,
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
  _users.where((x) => x.name == "Peter Crouch").first.followers.addAll([
    _users.where((x) => x.name == "Andy Carroll").first,
  ]);
  _users.where((x) => x.name == "Peter Crouch").first.following.addAll([
    _users.where((x) => x.name == "Andy Carroll").first,
  ]);
  _users.where((x) => x.name == "Steve Bruce").first.followers.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
    _users.where((x) => x.name == "Andy Carroll").first
  ]);
  _users.where((x) => x.name == "Steve Bruce").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
}

List<Song> _songs = _tracks;

class MockData {

  // This setup supports a singleton pattern to ensure that this class is only instantiated once

  bool hasBeenSetup = false;
  MockData._privateConstructor();
  static final MockData _instance = MockData._privateConstructor();
  factory MockData() {

    if (!_instance.hasBeenSetup) {
      _instance.setup();
      _instance.hasBeenSetup = true;
    }
    return _instance;
  }

  setup() {
    _addSongsToAlbums();
    _addFollowingFollowers();
  }

  List<Artist> get artists => _artists;
  List<Post> get posts => _posts;
  List<Song> get songs => _songs;
  List<Album> get albums => _albums;
  List<User> get users => _users;
  User get currentUser => _users.first;
}