import 'package:flutter/cupertino.dart';
import '../models/post.dart';
import '../models/comment.dart';
import '../viewmodels/homepage_view_model.dart';

class CommentsPageViewModel with ChangeNotifier {
  comment(Post post, String text) {
    // TODO: BETTER WAY THAN THIS MUST BE POSSIBLE
    if(post.comments.isEmpty) {
      post.comments = List.empty(growable: true);
    }

  //   Comment c = Comment(
  //     content: text,
  //     commenter: currentUser,
  //   );
  //
  //   post.comments.add(c);
  // }
  //
  // deleteComment(Post post, Comment comment) {
  //   post.comments.remove(comment);
  // }
  //
  // reply(Comment comment, String text) {
  //   if(comment.childComments.isEmpty) {
  //     comment.childComments = List.empty(growable: true);
  //   }
  //
  //   Comment c = Comment(
  //     content: text,
  //     commenter: currentUser,
  //   );
  //
  //   comment.childComments.add(c);
  // }
  //
  // deleteReply(Comment comment, Comment reply) {
  //   comment.childComments.remove(reply);
  // }
  //
  // like(Comment comment) {
  //   if(comment.likedBy.isEmpty) {
  //     comment.likedBy = List.empty(growable: true);
  //   }
  //
  //   if(comment.likedBy.contains(currentUser)) {
  //     comment.likedBy.remove(currentUser);
  //   } else {
  //     comment.likedBy.add(currentUser);
  //   }
   }
}