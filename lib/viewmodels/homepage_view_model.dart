import 'package:flutter/cupertino.dart';
import '../models/media_post.dart';
import '../models/original.dart';
import '../models/post.dart';
import '../models/profile.dart';
import '../models/text_post.dart';
import '../models/user.dart';
import '../models/artist.dart';

List<Post> initialData = List.from(
    [
      TextPost(
          likedBy: List.empty(),
          poster:
          User(
              name: "Kris Martin",
              followers: List.empty(),
              following: List.empty(),
              posts: List.empty(),
              image: "",
              profile: Profile()
          ),
          text: "Look at the stars, look how they shine for you", createdTime: DateTime.now()
      ),
      TextPost(
          likedBy: List.empty(),
          poster:
          User(
              name: "Billy Goat",
              followers: List.empty(),
              following: List.empty(),
              posts: List.empty(),
              image: "",
              profile: Profile()
          ),
          text: "Bebop", createdTime: DateTime.now()
      ),
      MediaPost(
          likedBy: List.empty(),
          poster:
          User(
              name: "Sean Dyche",
              followers: List.empty(),
              following: List.empty(),
              posts: List.empty(),
              image: "",
              profile: Profile()
          ),
          text: "I didn't actually eat the worms",
          href: "https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761", createdTime: DateTime.now(),
          song: Original(
              name: "Big Dreams",
              creator: Artist(name: 'Mike Jackson', image: '')
          )
      )
    ]
);


class HomepageViewModel with ChangeNotifier {

  final List<Post> _popularPosts = initialData;

  List<Post> get popularPosts => _popularPosts;

}