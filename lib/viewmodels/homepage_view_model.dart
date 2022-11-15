import 'package:flutter/cupertino.dart';
import '../models/media_post.dart';
import '../models/original.dart';
import '../models/post.dart';
import '../models/profile.dart';
import '../models/text_post.dart';
import '../models/user.dart';
import '../models/artist.dart';

// GROWABLE MUST BE TRUE OTHERWISE LISTS CANNOT HAVE ANY ITEMS

User currentUser = User(
  name: "Default User",
  followersUsername: List.empty(growable: true),
  followingUsername: List.empty(growable: true),
  posts: List.empty(growable: true),
  image: "",
  profile: Profile(),
);

List<Post> initialData = List.from(
    [
      TextPost(
          likedBy: [currentUser],
          posterUsername: "Kris Martin",
          text: "Look at the stars, look how they shine for you", createdTime: DateTime.now(),

      ),
      TextPost(
          likedBy: List.empty(growable: true),
          posterUsername: "Billy Goat",
          text: "Bebop", createdTime: DateTime.now()
      ),
      MediaPost(
          likedBy: List.empty(growable: true),
          posterUsername: "Sean Dyche",
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

  void likePost(Post post) {
    if(post.likedBy.contains(currentUser)) {
      post.likedBy.remove(currentUser); 
    } else { 
      post.likedBy.add(currentUser);
    }
  }
}