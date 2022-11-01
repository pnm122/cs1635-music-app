import 'package:flutter/cupertino.dart';

import '../models/post.dart';

List<Post> initialData = List.empty();

class HomepageViewModel with ChangeNotifier {

  final List<Post> _popularPosts = initialData;

  List<Post> get popularPosts => _popularPosts;

}