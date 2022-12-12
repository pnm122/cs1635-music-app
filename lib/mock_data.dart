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
      Artist(
          name: "Lord Huron",
          image: "https://wp.dailybruin.com/images/2021/10/web.ae_.lordhuron.vx_.review.jpg"
      ),
      Artist(
          name: "The Lumineers",
          image: "https://first-avenue.com/wp-content/uploads/2020/01/lumineers_new.jpg"
      ),
      Artist(
          name: "Noah Kahan",
          image: "https://images.sk-static.com/images/media/img/col3/20220708-045641-218359.jpg"
      ),
      Artist(
          name: "Lorde",
          image: "https://e1.pngegg.com/pngimages/475/502/png-clipart-lorde.png"
      ),
      Artist(
          name: "Hailaker",
          image: "https://f4.bcbits.com/img/0028689010_10.jpg"
      ),
      Artist(
          name: "Matt Maeson",
          image: "https://s3-us-west-1.amazonaws.com/wasserman-media-library/music_artists/matt-maeson-20190510.jpg"
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
      Album(name: "Your Other Life", tracks: [
      ], artist: _artists.where((x) => x.name == "Lord Huron").first, art: "https://www.lordhuron.com/files/2022/05/release_202205_ab67616d0000b2738be5edeeca4b2ac968f3db8a.jpg"),
      Album(name: "C-Sides", tracks: [
      ], artist: _artists.where((x) => x.name == "The Lumineers").first, art: "https://images.genius.com/f9c393229f2b3dc1db8e3bb89ed97bc8.640x640x1.jpg"),
      Album(name: "Cape Elizabeth", tracks: [
      ], artist: _artists.where((x) => x.name == "Noah Kahan").first, art: "https://noahkahan.com/files/2020/05/news_202005_Screen-Shot-2020-05-07-at-3.32.09-PM.jpg"),
      Album(name: "Tennis Court", tracks: [
      ], artist: _artists.where((x) => x.name == "Lorde").first, art: "https://upload.wikimedia.org/wikipedia/en/1/10/Lorde_Tennis_Court.png"),
      Album(name: "Not Much", tracks: [
      ], artist: _artists.where((x) => x.name == "Hailaker").first, art: "https://images.genius.com/6526e7c73ab66a20e6fbf7b366846882.996x1000x1.jpg"),
      Album(name: "A Memory Away", tracks: [
      ], artist: _artists.where((x) => x.name == "Matt Maeson").first, art: "https://i1.sndcdn.com/artworks-c66kuwa9oB4K-0-t500x500.jpg"),
    ]
);

List<Track> _tracks = List.from(
    [
      Track(
        name: "Bigger Stronger",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "The Blue Room").first,
        covers: []
      ),
      Track(
        name: "Don't Panic",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "The Blue Room").first,
        covers: []
      ),
      Track(
        name: "See You Soon",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "The Blue Room").first,
        covers: []
      ),
      Track(
        name: "High Speed",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "The Blue Room").first,
        covers: []
      ),
      Track(
        name: "Such a Rush",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "The Blue Room").first,
        covers: []
      ),
      Track(
        name: "Brothers & Sisters",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
        covers: []
      ),
      Track(
        name: "Easy To Please",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
        covers: []
      ),
      Track(
        name: "Only Superstition",
        creator: _artists.where((x) => x.name == "Coldplay").first,
        album: _albums.where((x) => x.name == "Brothers & Sisters").first,
        covers: []
      ),
      Track(
        name: "Something from Nothing",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "The Feast and The Famine",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "Congregation",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "What Did I Do?/God As My Witness",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "Outside",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "In The Clear",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "Subterranean",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "I Am A River",
        creator: _artists.where((x) => x.name == "Foo Fighters").first,
        album: _albums.where((x) => x.name == "Sonic Highways").first,
        covers: []
      ),
      Track(
        name: "Sense of Home",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
        covers: []
      ),
      Track(
        name: "Be Yourself",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
        covers: []
      ),
      Track(
        name: "The Words You Say",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
        covers: []
      ),
      Track(
        name: "Broken Feather",
        creator: _artists.where((x) => x.name == "Harrison Storm").first,
        album: _albums.where((x) => x.name == "Sense of Home").first,
        covers: []
      ),
      Track(
        name: "Your Other Life",
        creator: _artists.where((x) => x.name == "Lord Huron").first,
        album: _albums.where((x) => x.name == "Your Other Life").first,
        covers: [],
      ),
      Track(
        name: "Ton Autre Vie",
        creator: _artists.where((x) => x.name == "Lord Huron").first,
        album: _albums.where((x) => x.name == "Your Other Life").first,
        covers: [],
      ),
      Track(
        name: "Scotland",
        creator: _artists.where((x) => x.name == "The Lumineers").first,
        album: _albums.where((x) => x.name == "C-Sides").first,
        covers: [],
      ),
      Track(
        name: "For Fra",
        creator: _artists.where((x) => x.name == "The Lumineers").first,
        album: _albums.where((x) => x.name == "C-Sides").first,
        covers: [],
      ),
      Track(
        name: "Visions of China",
        creator: _artists.where((x) => x.name == "The Lumineers").first,
        album: _albums.where((x) => x.name == "C-Sides").first,
        covers: [],
      ),
      Track(
        name: "A Troubled Mind",
        creator: _artists.where((x) => x.name == "Noah Kahan").first,
        album: _albums.where((x) => x.name == "Cape Elizabeth").first,
        covers: [],
      ),
      Track(
        name: "Close Behind",
        creator: _artists.where((x) => x.name == "Noah Kahan").first,
        album: _albums.where((x) => x.name == "Cape Elizabeth").first,
        covers: [],
      ),
      Track(
        name: "Glue Myself Shut",
        creator: _artists.where((x) => x.name == "Noah Kahan").first,
        album: _albums.where((x) => x.name == "Cape Elizabeth").first,
        covers: [],
      ),
      Track(
        name: "Anyway",
        creator: _artists.where((x) => x.name == "Noah Kahan").first,
        album: _albums.where((x) => x.name == "Cape Elizabeth").first,
        covers: [],
      ),
      Track(
        name: "Maine",
        creator: _artists.where((x) => x.name == "Noah Kahan").first,
        album: _albums.where((x) => x.name == "Cape Elizabeth").first,
        covers: [],
      ),
      Track(
        name: "Tennis Court",
        creator: _artists.where((x) => x.name == "Lorde").first,
        album: _albums.where((x) => x.name == "Tennis Court").first,
        covers: [],
      ),
      Track(
        name: "Swingin Party",
        creator: _artists.where((x) => x.name == "Lorde").first,
        album: _albums.where((x) => x.name == "Tennis Court").first,
        covers: [],
      ),
      Track(
        name: "Not Much",
        creator: _artists.where((x) => x.name == "Hailaker").first,
        album: _albums.where((x) => x.name == "Not Much").first,
        covers: [],
      ),
      Track(
        name: "A Memory Away",
        creator: _artists.where((x) => x.name == "Matt Maeson").first,
        album: _albums.where((x) => x.name == "A Memory Away").first,
        covers: [],
      ),
      Track(
        name: "Blood Runs Red",
        creator: _artists.where((x) => x.name == "Matt Maeson").first,
        album: _albums.where((x) => x.name == "A Memory Away").first,
        covers: [],
      ),
      Track(
        name: "Nelsonwood Lane",
        creator: _artists.where((x) => x.name == "Matt Maeson").first,
        album: _albums.where((x) => x.name == "A Memory Away").first,
        covers: [],
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
      posts: List.empty(growable: true),
      image: "https://resources.premierleague.com/premierleague/photos/players/250x250/man40853.png",
      profile: Profile(
        bio: "Guy Fieri is my spirit animal.",
        favoriteSong: _tracks.where((x) => x.name == "See You Soon").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      id: 0,
  ),
  User(
      name: "Andy Carroll",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://goss.ie/wp-content/uploads/2022/05/Screenshot-2022-05-27-at-12.12.34.png",
      profile: Profile(
        bio: "I just wanna rock out.",
        favoriteSong: _tracks.where((x) => x.name == "Broken Feather").first,
        favoriteArtist: _artists.where((x) => x.name == "Michael Jackson").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
      ),
      id: 1,
  ),
  User(
      name: "Steve Bruce",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://static.wikia.nocookie.net/the-football-database/images/8/87/Steve_Bruce.1.png/revision/latest/scale-to-width-down/250?cb=20200705113041",
      profile: Profile(
        bio: "Music is my escape.",
        favoriteSong: _tracks.where((x) => x.name == "Outside").first,
        favoriteArtist: _artists.where((x) => x.name == "Coldplay").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      id: 2,
  ),
  User(
    name: "Ella Toone",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://www.thewikifeed.com/wp-content/uploads/2022/08/ella-ann-toone-1.jpg",
    profile: Profile(
      bio: "I'm a plant-loving, book-devouring, adventure-seeking, coffee-drinking, music-making, world-exploring, dog-loving, photo-taking, wanderlust-filled soul.",
      favoriteSong: _tracks.where((x) => x.name == "Blood Runs Red").first,
      favoriteArtist: _artists.where((x) => x.name == "Coldplay").first,
      favoriteAlbum: _albums.where((x) => x.name == "A Memory Away").first,
    ),
    id: 3,
  ),
  User(
      name: "Katie Zelem",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://secure.cache.images.core.optasports.com/soccer/players/150x150/185456.png",
      profile: Profile(
        bio: "Just a girl trying to make her way in the world, one adventure at a time. Lover of travel, good books, and all things cozy. 📚🌍❤️",
        favoriteSong: _tracks.where((x) => x.name == "Visions of China").first,
        favoriteArtist: _artists.where((x) => x.name == "Lorde").first,
        favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
      ),
      id: 4,
  ),
  User(
      name: "Jeese Lingard",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://cdn.redscores.com/images/player/820_b.png",
      profile: Profile(
        bio: "Beans Beans Beans Beans Beans!!!",
        favoriteSong: _tracks.where((x) => x.name == "Ton Autre Vie").first,
        favoriteArtist: _artists.where((x) => x.name == "\"Weird Al\" Yankovic").first,
        favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
      ),
    id: 5,
  ),
  User(
      name: "Phil Jones",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://icdn.strettynews.com/wp-content/uploads/2021/08/jones.jpg",
      profile: Profile(
        bio: "I love to listen and create new jams! Follow me if you enjoy British Blues!",
        favoriteSong: _tracks.where((x) => x.name == "High Speed").first,
        favoriteArtist: _artists.where((x) => x.name == "Foo Fighters").first,
        favoriteAlbum: _albums.where((x) => x.name == "A Memory Away").first,
      ),
      id: 6,
  ),
  User(
      name: "José Mourinho",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://www.thestatesman.com/wp-content/uploads/2017/08/1498803075-jose-mourinho-instagram.jpg",
      profile: Profile(
        bio: "I am the special one.",
        favoriteSong: _tracks.where((x) => x.name == "Brothers & Sisters").first,
        favoriteArtist: _artists.where((x) => x.name == "Lord Huron").first,
        favoriteAlbum: _albums.where((x) => x.name == "Sense of Home").first,
      ),
      id: 7,
  ),
  User(
      name: "Kepa Arrizabalaga",
      followers: [
      ],
      following: [
      ],
      posts: List.empty(growable: true),
      image: "https://img.chelseafc.com//image/upload/f_auto,q_auto:best,f_auto,q_90,w_1440,c_fill,g_faces/editorial/news/2019/9/kepa-mag-plug.jpg",
      profile: Profile(
        bio: "They call me a flop but in reality I'm just a below average performer.",
        favoriteSong: _tracks.where((x) => x.name == "Anyway").first,
        favoriteArtist: _artists.where((x) => x.name == "The Lumineers").first,
        favoriteAlbum: _albums.where((x) => x.name == "C-Sides").first,
      ),
      id: 8,
  ),
  User(
    name: "Peter Crouch",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://media.gq-magazine.co.uk/photos/5f5b668ceadd3a2aff8f3232/16:9/w_2560%2Cc_limit/Crouchy.jpg",
    profile: Profile(
      bio: "I'm into folktronica and indie cloud rap.",
      favoriteSong: _tracks.where((x) => x.name == "Only Superstition").first,
      favoriteArtist: _artists.where((x) => x.name == "\"Weird Al\" Yankovic").first,
      favoriteAlbum: _albums.where((x) => x.name == "Sonic Highways").first,
    ),
    id: 9,
  ),
  User(
    name: "Harry Maguire",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://cdn.standardmedia.co.ke/images/sunday/hgvwm4oz3pinohexehm5d46a37fac8c0.png",
    profile: Profile(
      bio: "I enjoy wrestling and pudding.",
      favoriteSong: _tracks.where((x) => x.name == "Blood Runs Red").first,
      favoriteArtist: _artists.where((x) => x.name == "The Lumineers").first,
      favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
    ),
    id: 10,
  ),
  User(
    name: "David Moyes",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://i2-prod.football.london/west-ham-united-fc/article20327478.ece/ALTERNATES/s615/0_GettyImages-1232133453.jpg",
    profile: Profile(
      bio: "Do I feel I should have been given more time?",
      favoriteSong: _tracks.where((x) => x.name == "Visions of China").first,
      favoriteArtist: _artists.where((x) => x.name == "Lorde").first,
      favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
    ),
    id: 11,
  ),
  User(
    name: "Leah Galton",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://64.media.tumblr.com/98b396b25100735663401a9c18fcb0c2/fc9e47b0261e53d4-ae/s640x960/45f08c9fabfd051196c34e3aca30a2a6276e7b57.pnj",
    profile: Profile(
      bio: "Love hiking, good coffee, and my dog Max.",
      favoriteSong: _tracks.where((x) => x.name == "Visions of China").first,
      favoriteArtist: _artists.where((x) => x.name == "Lorde").first,
      favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
    ),
    id: 12,
  ),
  User(
    name: "Lucy Staniforth",
    followers: [
    ],
    following: [
    ],
    posts: List.empty(growable: true),
    image: "https://dailycannon.com/static/uploads/2020/02/Lucy-Staniforth.jpg",
    profile: Profile(
      bio: "Always up for an adventure and trying new things. Life is too short to be boring!",
      favoriteSong: _tracks.where((x) => x.name == "Visions of China").first,
      favoriteArtist: _artists.where((x) => x.name == "Lorde").first,
      favoriteAlbum: _albums.where((x) => x.name == "Tennis Court").first,
    ),
    id: 12,
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
      isPinned: true,
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
        Comment(
            content: "The Words You Say off of Sense of Home is fire.",
            commenter: _users.where((x) => x.name == "Peter Crouch").first,
            likedBy: [
              _users.where((x) => x.name == "Steve Bruce").first,
              _users.where((x) => x.name == "Sean Dyche").first,
              _users.where((x) => x.name == "Andy Carroll").first,
            ],
            childComments: [
              Comment(
                  content: "Agreed. I remember when I came out, I was listening nonstop.",
                  commenter: _users.where((x) => x.name == "Andy Carroll").first,
              )
            ]
        ),
        Comment(
            content: "I also want to add that I already have listened to Coldplay's Only Superstition and wasn't a fan.",
            commenter: _users.where((x) => x.name == "Steve Bruce").first,
        ),
      ]
  ),
  TextPost(
      isPinned: true,
      poster: _users.where((x) => x.name == "Peter Crouch").first,
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
      ],
  ),
  MediaPost(
      poster: _users.where((x) => x.name == "Andy Carroll").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
      ],
      text: "Here is my cover of Harrison Storm's Broken Feather",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2022, 11, 15, 9, 58),
      song: _tracks.where((x) => x.name == "Broken Feather").first
  ),
  MediaPost(
      poster: _users.where((x) => x.name == "Sean Dyche").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
      ],
      text: "Watch my jam session",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2022, 11, 15, 9, 58),
      song: _tracks.where((x) => x.name == "Only Superstition").first
  ),
  TextPost(
    isPinned: true,
    poster: _users.where((x) => x.name == 'Sean Dyche').first,
    likedBy: [
      _users.where((x) => x.name == "Andy Carroll").first,
      _users.where((x) => x.name == "Peter Crouch").first,
      _users.where((x) => x.name == "Sean Dyche").first,
    ],
    text: 'This chilly weather makes me want to listen to COLD-PLAY... get it?',
    createdTime: DateTime.utc(2017, 1, 31, 1, 9),
  ),
  TextPost(
    isPinned: false,
    poster: _users.where((x) => x.name == 'Sean Dyche').first,
    likedBy: [
      _users.where((x) => x.name == "Andy Carroll").first,
      _users.where((x) => x.name == "Peter Crouch").first,
      _users.where((x) => x.name == "Kepa Arrizabalaga").first,
      _users.where((x) => x.name == "José Mourinho").first,
      _users.where((x) => x.name == "Phil Jones").first,
      _users.where((x) => x.name == "Jeese Lingard").first,
      _users.where((x) => x.name == "David Moyes").first,
      _users.where((x) => x.name == "Harry Maguire").first,
    ],
    text: 'I could listen to that song on repeat for hours and never get tired of it.',
    createdTime: DateTime.utc(2022, 2, 6, 5, 44),
  ),
  MediaPost(
      poster: _users.where((x) => x.name == "Jeese Lingard").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
        _users.where((x) => x.name == "Harry Maguire").first,
        _users.where((x) => x.name == "José Mourinho").first,
        _users.where((x) => x.name == "Kepa Arrizabalaga").first,
      ],
      text: "I just posted a cover of my favorite song, check it out!",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2019, 1, 27, 11, 3),
      song: _tracks.where((x) => x.name == "Blood Runs Red").first
  ),
  MediaPost(
      poster: _users.where((x) => x.name == "Kepa Arrizabalaga").first,
      likedBy: [
        _users.where((x) => x.name == "Peter Crouch").first,
        _users.where((x) => x.name == "Harry Maguire").first,
        _users.where((x) => x.name == "David Moyes").first,
      ],
      text: " a beautiful piano rendition of Ton Autre Vie",
      href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761",
      createdTime: DateTime.utc(2017, 12, 1, 3, 30),
      song: _tracks.where((x) => x.name == "Ton Autre Vie").first,
      comments: [
        Comment(
            content: "The is sick bro!!!",
            commenter: _users.where((x) => x.name == "Harry Maguire").first,
            likedBy: [
              _users.where((x) => x.name == "Andy Carroll").first,
              _users.where((x) => x.name == "Sean Dyche").first,
              _users.where((x) => x.name == "Peter Crouch").first,
            ],
          childComments: [
            Comment(
                content: "Thx Harry!",
                commenter: _users.where((x) => x.name == "Kepa Arrizabalaga").first,
                likedBy: [
                ]
            ),
          ]
        ),
        Comment(
            content: "Your vocal range is mighty impressive!",
            commenter: _users.where((x) => x.name == "David Moyes").first,
            likedBy: [
              _users.where((x) => x.name == "Andy Carroll").first,
              _users.where((x) => x.name == "Sean Dyche").first,
              _users.where((x) => x.name == "Peter Crouch").first,
              _users.where((x) => x.name == "Steve Bruce").first,
            ]
        ),
        Comment(
            content: "I honestly like this better than the original",
            commenter: _users.where((x) => x.name == "Peter Crouch").first,
            likedBy: [
              _users.where((x) => x.name == "Andy Carroll").first,
            ]
        ),
      ]
  ),
]);

_addSongsToAlbums() {
  _albums.where((x) => x.name == "The Blue Room").first.tracks.addAll(_tracks.where((x) => x.album.name == "The Blue Room"));
  _albums.where((x) => x.name == "Brothers & Sisters").first.tracks.addAll(_tracks.where((x) => x.album.name == "Brothers & Sisters"));
  _albums.where((x) => x.name == "Sonic Highways").first.tracks.addAll(_tracks.where((x) => x.album.name == "Sonic Highways"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Sense of Home"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Your Other Life"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "C-Sides"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Cape Elizabeth"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Tennis Court"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "Not Much"));
  _albums.where((x) => x.name == "Sense of Home").first.tracks.addAll(_tracks.where((x) => x.album.name == "A Memory Away"));
}

_addFollowingFollowers() {
  _users.where((x) => x.name == "Sean Dyche").first.followers.addAll([
    _users.where((x) => x.name == "Steve Bruce").first,
    _users.where((x) => x.name == "Andy Carroll").first,
    _users.where((x) => x.name == "Harry Maguire").first,
    _users.where((x) => x.name == "David Moyes").first,
    _users.where((x) => x.name == "Jeese Lingard").first,
    _users.where((x) => x.name == "Phil Jones").first,
    _users.where((x) => x.name == "José Mourinho").first,
    _users.where((x) => x.name == "Kepa Arrizabalaga").first,
  ]);
  _users.where((x) => x.name == "Sean Dyche").first.following.addAll([
    _users.where((x) => x.name == "Steve Bruce").first,
    _users.where((x) => x.name == "Kepa Arrizabalaga").first,
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
    _users.where((x) => x.name == "Jeese Lingard").first,
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
  _users.where((x) => x.name == "Harry Maguire").first.followers.addAll([
    _users.where((x) => x.name == "David Moyes").first,
  ]);
  _users.where((x) => x.name == "Harry Maguire").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
  _users.where((x) => x.name == "David Moyes").first.followers.addAll([
  ]);
  _users.where((x) => x.name == "David Moyes").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
    _users.where((x) => x.name == "Harry Maguire").first,
    _users.where((x) => x.name == "Jeese Lingard").first,
  ]);
  _users.where((x) => x.name == "Jeese Lingard").first.followers.addAll([
    _users.where((x) => x.name == "David Moyes").first
  ]);
  _users.where((x) => x.name == "Jeese Lingard").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
    _users.where((x) => x.name == "Peter Crouch").first,
  ]);
  _users.where((x) => x.name == "Phil Jones").first.followers.addAll([
  ]);
  _users.where((x) => x.name == "Phil Jones").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
  _users.where((x) => x.name == "José Mourinho").first.followers.addAll([
  ]);
  _users.where((x) => x.name == "José Mourinho").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
  _users.where((x) => x.name == "Kepa Arrizabalaga").first.followers.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
  _users.where((x) => x.name == "Kepa Arrizabalaga").first.following.addAll([
    _users.where((x) => x.name == "Sean Dyche").first,
  ]);
}

_addPostsToUser() {
  for (var user in _users) {
    _users.where((x) => x == user).first.posts.addAll(_posts.where((x) => x.poster == user));
  }
}

_addCoversToTracks() {
  for (var track in _tracks) {
    _tracks.where((x) => x == track).first.covers
        .addAll(_posts.whereType<MediaPost>().where((x) => x.song == track));
  }
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
    _addPostsToUser();
    // _tracks.where((element) => element.name == "Broken Feather").first.covers
    //   .addAll(_posts.whereType<MediaPost>());
    _addCoversToTracks();
  }

  List<Artist> get artists => _artists;
  List<Post> get posts => _posts;
  List<Song> get songs => _songs;
  List<Album> get albums => _albums;
  List<User> get users => _users;
  User get currentUser => _users.where((x) => x.id == 0).first;
}