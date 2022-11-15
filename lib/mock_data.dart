// This serves as a place to store mock data that ViewModels can use

import 'package:test_app/models/artist.dart';
import 'package:test_app/models/media_post.dart';
import 'package:test_app/models/profile.dart';

import 'models/album.dart';
import 'models/comment.dart';
import 'models/post.dart';
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



List<Track> _tracks = List.from(
  [
    Track(
      name: "Bigger Stronger",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "The Blue Room",
    ),
    Track(
      name: "Don't Panic",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "The Blue Room",
    ),
    Track(
      name: "See You Soon",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "The Blue Room",
    ),
    Track(
      name: "High Speed",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "The Blue Room",
    ),
    Track(
      name: "Such a Rush",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "The Blue Room",
    ),
    Track(
      name: "Brothers & Sisters",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "Brothers & Sisters",
    ),
    Track(
      name: "Easy To Please",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "Brothers & Sisters",
    ),
    Track(
      name: "Only Superstition",
      creator: _artists.where((x) => x.name == "Coldplay").first,
      albumName: "Brothers & Sisters",
    ),
    Track(
      name: "Something from Nothing",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "The Feast and The Famine",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "Congregation",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "What Did I Do?/God As My Witness",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "Outside",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "In The Clear",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "Subterranean",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "I Am A River",
      creator: _artists.where((x) => x.name == "Foo Fighters").first,
      albumName: "Sonic Highways",
    ),
    Track(
      name: "Sense of Home",
      creator: _artists.where((x) => x.name == "Harrison Storm").first,
      albumName: "Sense of Home",
    ),
    Track(
      name: "Be Yourself",
      creator: _artists.where((x) => x.name == "Harrison Storm").first,
      albumName: "Sense of Home",
    ),
    Track(
      name: "The Words You Say",
      creator: _artists.where((x) => x.name == "Harrison Storm").first,
      albumName: "Sense of Home",
    ),
    Track(
      name: "Broken Feather",
      creator: _artists.where((x) => x.name == "Harrison Storm").first,
      albumName: "Sense of Home",
    ),
  ]
);

List<Album> _albums = List.from(
    [
      Album(name: "The Blue Room", tracks: [
        _tracks.where((x) => x.name == "Bigger Stronger").first,
        _tracks.where((x) => x.name == "Don't Panic").first,
        _tracks.where((x) => x.name == "See You Soon").first,
        _tracks.where((x) => x.name == "High Speed").first,
        _tracks.where((x) => x.name == "Such a Rush").first,
      ], artistName: "Coldplay", art: "https://upload.wikimedia.org/wikipedia/en/a/a4/Blue_room_ep.jpg"),
      Album(name: "Brothers & Sisters", tracks: [
        _tracks.where((x) => x.name == "Brothers & Sisters").first,
        _tracks.where((x) => x.name == "Easy To Please").first,
        _tracks.where((x) => x.name == "Only Superstition").first,
      ], artistName: "Coldplay", art: "https://upload.wikimedia.org/wikipedia/en/8/8d/Brothers%26sisters.jpg"),
      Album(name: "Sonic Highways", tracks: [
        _tracks.where((x) => x.name == "Something from Nothing").first,
        _tracks.where((x) => x.name == "The Feast and The Famine").first,
        _tracks.where((x) => x.name == "Congregation").first,
        _tracks.where((x) => x.name == "What Did I Do?/God As My Witness").first,
        _tracks.where((x) => x.name == "Outside").first,
        _tracks.where((x) => x.name == "In The Clear").first,
        _tracks.where((x) => x.name == "Subterranean").first,
        _tracks.where((x) => x.name == "I Am A River").first,
      ], artistName: "Foo Fighters", art: "https://upload.wikimedia.org/wikipedia/en/6/67/Foo_Fighters_8LP_Sonic_Highways.jpg"),
      Album(name: "Sense of Home", tracks: [
        _tracks.where((x) => x.name == "Sense of Home").first,
        _tracks.where((x) => x.name == "Be Yourself").first,
        _tracks.where((x) => x.name == "The Words You Say").first,
        _tracks.where((x) => x.name == "Broken Feather").first,
      ], artistName: "Harrison Storm", art: "https://images.genius.com/dba6d5bf9692b5d96efd96ef48bc1670.1000x894x1.jpg"),
    ]
);

List<User> _users = List.from([
  User(
    name: "Sean Dyche",
    followersUsername: [
      "Steve Bruce",
    ],
    followingUsername: [
      "Peter Crouch",
      "Andy Carroll",
      "Steve Bruce"
    ],
    posts: List.empty(),
    image: "https://i2-prod.mirror.co.uk/incoming/article23403859.ece/ALTERNATES/s1200c/1_Sean-Dyche-file-photo.jpg",
    profile: Profile(
      bio: "In my free time I listen to crunching gravel.",
      favoriteSong: _tracks.where((x) => x.name == "See You Soon").first,
      favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
      favoriteAlbum: _albums.where((x) => x.name == "The Blue Room").first,
    )
  ),
  User(
      name: "Peter Crouch",
      followersUsername: [
        "Sean Dyche",
        "Andy Carroll"
      ],
      followingUsername: [
        "Andy Carroll"
      ],
      posts: List.empty(),
      image: "https://media.gq-magazine.co.uk/photos/61a8ffb65d423b74f72b6651/master/pass/021221_Crouch_HP2.jpg",
      profile: Profile(
        bio: "I'm into folktronica and indie cloud rap.",
        favoriteSong: _tracks.where((x) => x.name == "Only Superstition").first,
        favoriteArtist: _artists.where((x) => x.name == "\"Weird Al\" Yankovic").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
      )
  ),
  User(
      name: "Andy Carroll",
      followersUsername: [
        "Sean Dyche",
        "Peter Crouch"
      ],
      followingUsername: [
        "Peter Crouch",
      ],
      posts: List.empty(),
      image: "https://www.famousbirthdays.com/faces/carroll-andy-image.jpg",
      profile: Profile(
        bio: "I just wanna rock out.",
        favoriteSong: _tracks.where((x) => x.name == "Broken Feather").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
      )
  ),
  User(
      name: "Steve Bruce",
      followersUsername: [
        "Sean Dyche"
      ],
      followingUsername: [
        "Sean Dyche"
      ],
      posts: List.empty(),
      image: "https://www.planetsport.com/image-library/square/1200/w/west-bromwich-albion-manager-steve-bruce-feb22.jpg",
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
    posterUsername: 'Steve Bruce',
    likedBy: [
      _users.where((x) => x.name == "Andy Carroll").first,
      _users.where((x) => x.name == "Peter Crouch").first,
      _users.where((x) => x.name == "Sean Dyche").first,
    ],
    text: 'What are yinz kids listening to these days?',
    createdTime: DateTime.utc(2019, 12, 20, 10, 19),
  ),
  TextPost(
    posterUsername: 'Steve Bruce',
    likedBy: [
      _users.where((x) => x.name == "Sean Dyche").first,
    ],
    text: 'What should I listen to if I like Coldplay\'s Easy To Please?',
    createdTime: DateTime.utc(2020, 1, 31, 22, 59),
    comments: [
      Comment(
        content: "I recommend Coldplay's Bigger Stronger off of The Blue Room album.",
        commenterUsername: "Sean Dyche",
        likedByUsers: [
         "Steve Bruce"
        ],
        childComments: [
          Comment(
            content: "Thanks Sean! I'll have to check it out.",
            commenterUsername: "Steve Bruce",
            likedByUsers: [
              "Sean Dyche"
            ]
          )
        ]
      ),
    ]
  ),
  TextPost(
    posterUsername: 'Steve Bruce',
    likedBy: [
      _users.where((x) => x.name == "Peter Crouch").first,
      _users.where((x) => x.name == "Andy Carroll").first,
    ],
    text: 'Does anyone actually still listen to Micheal Jackson?',
    createdTime: DateTime.utc(2020, 12, 3, 2, 9),
    comments: [
      Comment(
        content: "Of course!",
        commenterUsername: "Andy Carroll",
        likedByUsers: [
          "Andy Carroll",
          "Sean Dyche",
          "Peter Crouch",
          "Steve Bruce"
        ]
      ),
    ]
  ),
  MediaPost(
      posterUsername: "Andy Carroll",
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
      ],
      text: "Here is my cover of Harrison Storm's Broken Feather",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2022, 11, 15, 9, 58),
      song: _tracks.where((x) => x.name == "Broken Feather").first)
]);

class MockData {

  List<Artist> get artists => _artists;

}