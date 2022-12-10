import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
// import 'package:video_player/video_player.dart';
// import 'package:test_app/widgets/video_widget.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/post.dart';
import 'package:test_app/models/text_post.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/viewmodels/homepage/homepage_view_model.dart';
import 'package:test_app/widgets/common/comments_widget.dart';
import 'package:test_app/widgets/common/misc_widgets.dart';
import 'package:test_app/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:test_app/router_constants.dart';

import 'package:test_app/viewmodels/homepage/post_view_model.dart';

import '../../models/post.dart';
import '../../models/user.dart';

/// Container for all posts displayed in a view
class PostView extends StatefulWidget {
  final PostOrganizeType postOrganizeType;
  final User? user;
  const PostView({super.key, required this.postOrganizeType, this.user});
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  @override
  Widget build(BuildContext context) {
    //var postList = widget.isPopularPosts ? context.watch<PostViewModel>().popularPosts : context.watch<PostViewModel>().followingPosts;
    var posts = context.watch<PostViewModel>().getPosts(postOrganizeType: widget.postOrganizeType, user: widget.user);

    return posts.isEmpty ? const Center(child: Text("No posts yet...")) : ListView.builder(
      // Lets us wrap pages that contain this ListView with a SingleChildScrollView so the whole page can scroll!
      shrinkWrap: true,
        // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),
        itemCount: posts.length,
        itemBuilder: (context, i) {
          // Text Post
          // TODO: Turn this into its own widget
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Poster
              PosterInfo(
                user: posts[i].poster,
                post: posts[i],
                postOrganizeType: widget.postOrganizeType,
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Content (Text Post)
              PostContent(
                post: posts[i],
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Interaction icons
              PostInteraction(
                post: posts[i],
              ),

              // extra space between each post
              const SizedBox(height: postGap),
            ],
          );
        });
  }
}


/// Avatar, name, and following button attached to the top of each post
class PosterInfo extends StatefulWidget {
  const PosterInfo({super.key, required this.user, required this.post, required this.postOrganizeType});
  final dynamic user;
  final Post post;
  final PostOrganizeType postOrganizeType;

  @override
  State<PosterInfo> createState() => _PosterInfoState();
}

class _PosterInfoState extends State<PosterInfo> {
  @override
  Widget build(BuildContext context) {
    var currentUser = context.watch<PostViewModel>().currentUser;

    return Row(
      children: <Widget>[
        // Profile
        TextButton(
          style: ButtonStyle(
            // MaterialStateProperty.all means to use that style for all states of the button
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary),
            textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.labelLarge),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: () {
            Navigator.pushNamed(context, profileRoute, arguments: widget.user);
          },

          child: Row(children: <Widget>[
            UserImage(imageURL: widget.user.image),
            const SizedBox(width: 5),
            Text(widget.user.name),
          ]),
        ),

        const SizedBox(width: 5),

        // Following button
        OutlinedButton(
          style: currentUser.following.contains(widget.user)
            ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.outline),
              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
              ),
              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
            )
            : ButtonStyle(
                // MaterialStateProperty.all means to use that style for all states of the button
                foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelMedium),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            ),
          // TODO: Follow this user when this button is pressed
          onPressed: () { 
            context.read<PostViewModel>().follow(widget.user);
            // if(widget.isHomepage) {
            //   context.read<HomePageViewModel>().updateFollowingPosts();
            // }
          },
          child: currentUser.following.contains(widget.user)
            ? const Text("Following")
            : const Text("Follow")
        ),
        Spacer(),
        Visibility(
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(widget.post.isPinned ? Icons.push_pin : Icons.push_pin_outlined, color: Colors.white), onPressed: () { context.read<PostViewModel>().pinPress(widget.post); },
          ),
          visible: (widget.postOrganizeType == PostOrganizeType.user),
        ),

      ],
    );
  }
}


/// Content of each post 
class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.post});
  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fill width
      width: double.infinity,
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        color: Theme.of(context).colorScheme.surface,
      ),

      // padding on text posts only
      padding: post is TextPost ? const EdgeInsets.all(postPadding) : const EdgeInsets.all(0),

      child: post is TextPost
        ? Text(post.text,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary))
        : Stack(
          children: <Widget>[
            CustomVideoPlayer(
              videoPlayerController: VideoPlayerController.network(post.href),
            ),
            // Song info 
            Positioned(
              left: 12,
              top: 12,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.music_note, size: smallIconSize),
                      const SizedBox(width: smallGap),
                      Text(post.song.name),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.person, size: smallIconSize),
                      const SizedBox(width: smallGap),
                      Text(
                        post.song.creator.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}




/// Interaction buttons (favorite and comment) attached to the bottom of each post
class PostInteraction extends StatefulWidget {
  const PostInteraction({super.key, required this.post});
  final dynamic post;

  State<PostInteraction> createState() => _PostInteractionState();
}

class _PostInteractionState extends State<PostInteraction> {
  @override
  Widget build(BuildContext context) {
    // TODO: How do I watch individual posts so that all this stuff updates the way I want?

    var currentUser = context.watch<PostViewModel>().currentUser;
    return Row(
      children: <Widget>[
        // Favorite button
        Column(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              isSelected: false,
              onPressed: () {
                context.read<PostViewModel>().likePost(widget.post);
                },
              icon: widget.post.likedBy.contains(currentUser)
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
        Column(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context, 
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    child: ChangeNotifierProvider<CommentsPageViewModel>(
                      child: Comments(),
                      create: (_) => CommentsPageViewModel(relatedPost: widget.post),
                    ),
                  ),
                );
                //Navigator.pushNamed(context, commentsRoute, arguments: widget.post);
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