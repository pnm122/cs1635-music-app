import 'package:flutter/cupertino.dart';
import '../../mock_data.dart';
import '../../models/post.dart';
import '../../models/comment.dart';

class CommentsPageViewModel with ChangeNotifier {
  CommentsPageViewModel({required this.relatedPost});
  Post relatedPost;

  Post get post => relatedPost;

  comment(String text) {
    // TODO: BETTER WAY THAN THIS MUST BE POSSIBLE
    if(post.comments.isEmpty) {
      post.comments = List.empty(growable: true);
    }

    Comment c = Comment(
      content: text,
      commenter: MockData().currentUser,
    );

    post.comments.add(c);
    notifyListeners();
  }

  deleteComment(Comment comment) {
    post.comments.remove(comment);
    notifyListeners();
  }

  reply(Comment comment, String text) {
    if(comment.childComments.isEmpty) {
      comment.childComments = List.empty(growable: true);
    }

    Comment c = Comment(
      content: text,
      commenter: MockData().currentUser,
    );

    comment.childComments.add(c);
    notifyListeners();
  }

  deleteReply(Comment comment, Comment reply) {
    comment.childComments.remove(reply);
    notifyListeners();
  }

  like(Comment comment) {
    if(comment.likedBy.isEmpty) {
      comment.likedBy = List.empty(growable: true);
    }

    if(comment.likedBy.contains(MockData().currentUser)) {
      comment.likedBy.remove(MockData().currentUser);
    } else {
      comment.likedBy.add(MockData().currentUser);
    }
    notifyListeners();
  }
}