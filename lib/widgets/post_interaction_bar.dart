import 'package:flutter/material.dart';
import 'package:test_app/viewmodels/comments_page_view_model.dart';
import '../mock_data.dart';
import '../viewmodels/homepage_view_model.dart';
import '../widgets/comments_widget.dart';
import 'package:provider/provider.dart';

class PostInteraction extends StatefulWidget {
  const PostInteraction({super.key, required this.post});
  final dynamic post;

  State<PostInteraction> createState() => _PostInteractionState();
}

class _PostInteractionState extends State<PostInteraction> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Favorite button
        // TODO: Update favorited posts and icon state if clicked
        // TODO: Initial icon state based on if the user already liked the post or not
        Column(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              isSelected: false,
              // TODO: Can we use a context.watch to achieve this somehow?
              onPressed: () { setState((){context.read<HomepageViewModel>().likePost(widget.post);}); },
              icon: widget.post.likedBy.contains(MockData().currentUser)
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_outline, color: Colors.white)
            ),
            Text(
              widget.post.likedBy.length.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontFamily: "Nunito"),
            ),
          ],
        ),

        // Gap between icons
        const SizedBox(width: 8),

        // Comment button
        // TODO: Take you to the post's comment page when clicked
        Column(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => (ChangeNotifierProvider<CommentsPageViewModel>(
                      child: Comments(post: widget.post),
                      create: (_) => CommentsPageViewModel(),
                    )),
                  ),
                );
              },
              icon: const Icon(Icons.comment, color: Colors.white),
            ),
            Text(
              widget.post.comments.length.toString(),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontFamily: "Nunito"),
            ),
          ],
        ),
      ],
    );
  }
}
