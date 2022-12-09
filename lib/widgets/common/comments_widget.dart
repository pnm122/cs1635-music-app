import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/viewmodels/homepage/comments_page_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:test_app/widgets/common/user_image.dart';
import '../../mock_data.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // UI info for displaying and deciding what to call from CommentsPageViewModel
  bool replying = false;
  dynamic replyingTo;

  @override
  Widget build(BuildContext context) {
    var post = context.watch<CommentsPageViewModel>().post;

    return Scaffold(
      // To avoid annoying issue with background sticking out of rounded appBar
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        title: "Comments",
        showBackButton: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),

      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView.builder(
          // Extra padding on bottom as a workaround of bottomSheet overlaying on top of the body
          // Apparently there's no way to fix this in flutter still :(
          padding: EdgeInsets.only(top: sectionPadding, left: sectionPadding, right: sectionPadding, bottom: MediaQuery.of(context).size.height / 3),
          itemCount: post.comments.length,

          // Each item is a comment + any replies
          itemBuilder:(context, i) {
            dynamic c = post.comments[i];

            // Container for comment + replies
            return Column(
              children: [
                // Main comment
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ 
                    // TODO: Bring to user profile
                    UserImage(imageURL: c.commenter.image),

                    const SizedBox(width: postSectionMargin),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TODO: Bring to user profile
                          Text(
                            c.commenter.name,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                          ),
                    
                      
                          Text(
                            c.content,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
                          ),
                    
                    
                          const SizedBox(height: 4.0),
                    
                          Row(
                            children: <Widget>[
                    
                              // Liking
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    iconSize: smallIconSize,
                                    isSelected: false,
                                    // TODO: Can we use a context.watch to achieve this somehow?
                                    onPressed: () { 
                                      context.read<CommentsPageViewModel>().like(post.comments[i]);
                                    },
                                    icon: c.likedBy.contains(MockData().currentUser)
                                      ? const Icon(Icons.favorite, color: Colors.red)
                                      : const Icon(Icons.favorite_outline, color: Colors.white)
                                  ),
                                  Text(
                                    c.likedBy.length.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(fontFamily: "Nunito"),
                                  ),
                                ],
                              ),
                    
                              // Replying
                              TextButton(
                                child: Text(
                                  "Reply",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                    
                                onPressed: () {
                                  setState(
                                    () { 
                                      replying = true;
                                      replyingTo = c;
                                    }
                                  );
                                },
                              ),

                              // Allow deleting if the commenter is the current user
                              if(identical(c.commenter, MockData().currentUser)) TextButton(
                                child: Text(
                                  "Delete",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),

                                onPressed: () { 
                                  // Confirm that the user wants to delete this comment
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      backgroundColor: Theme.of(context).colorScheme.background,

                                      title: const Text("Are you sure you want to delete this comment?"),
                                      actions: [
                                        IconButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          icon: const Icon(Icons.close, color: Colors.red),
                                        ),
                                        IconButton(
                                          onPressed: () { 
                                            context.read<CommentsPageViewModel>().deleteComment(c);
                                            Navigator.pop(context, 'OK'); 
                                          },
                                          icon: const Icon(Icons.check, color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                // Replies to main comment
                ListView.builder(
                  itemCount: c.childComments.length,

                  // Fix to allow listview inside another listview
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),

                  itemBuilder:(context, j) {
                    dynamic r = c.childComments[j];

                    return Container(
                      padding: const EdgeInsets.only(left: 42.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: smallGap),

                          // Reply
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[ 
                              // TODO: Bring to user profile
                              UserImage(imageURL: r.commenter.image),

                              const SizedBox(width: postSectionMargin),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // TODO: Bring to user profile
                                    Text(
                                      r.commenter.name,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                                    ),
                              
                                
                                    Text(
                                      r.content,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
                                    ),
                              
                              
                                    const SizedBox(height: 4.0),
                              
                                    Row(
                                      children: <Widget>[
                              
                                        // Liking
                                        Column(
                                          children: <Widget>[
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                              iconSize: smallIconSize,
                                              isSelected: false,
                                              // TODO: Can we use a context.watch to achieve this somehow?
                                              onPressed: () { 
                                                context.read<CommentsPageViewModel>().like(c.childComments[j]);
                                              },
                                              icon: r.likedBy.contains(MockData().currentUser)
                                                ? const Icon(Icons.favorite, color: Colors.red)
                                                : const Icon(Icons.favorite_outline, color: Colors.white)
                                            ),
                                            Text(
                                              r.likedBy.length.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(fontFamily: "Nunito"),
                                            ),
                                          ],
                                        ),
                              
                                        // Can't reply to replies

                                        // Allow deleting if the commenter is the current user
                                        if(identical(r.commenter, MockData().currentUser)) TextButton(
                                          child: Text(
                                            "Delete",
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),

                                          onPressed: () { 
                                            // Confirm that the user wants to delete this comment
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                backgroundColor: Theme.of(context).colorScheme.background,

                                                title: const Text("Are you sure you want to delete this comment?"),
                                                actions: [
                                                  IconButton(
                                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                                    icon: const Icon(Icons.close, color: Colors.red),
                                                  ),
                                                  IconButton(
                                                    onPressed: () { 
                                                      context.read<CommentsPageViewModel>().deleteReply(c, r);
                                                      Navigator.pop(context, 'OK'); 
                                                    },
                                                    icon: const Icon(Icons.check, color: Colors.green),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],

                          ),

                        ],
                      ),
                    );
                  }
                ),

                const SizedBox(height: sectionPadding),
              ],
            );
          },
        ),
      ),
      
      // Using a wrap to fit the height of the bottomSheet to the content
      bottomSheet: Wrap(
        children: [
          Column(
            children: [

              // Tell the user that they're replying to a comment if they are
              replying ? Container(
                color: Theme.of(context).colorScheme.onBackground,
                padding: const EdgeInsets.symmetric(horizontal: sectionPadding, vertical: 4.0),

                child: Row(
                  children: <Widget>[
                    Expanded(child: Text(
                      "Replying to ${replyingTo.commenter.name}:",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    )),

                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () { setState((){replying = false;}); },
                    ),
                  ],
                ),
              ) : Container(height:0),

              // Comment creating text field and button
              Container(
                padding: const EdgeInsets.all(sectionPadding),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,

                  // Estimating the app bar shadow (idk how to just copy it)
                  boxShadow: const [BoxShadow(
                    color: Colors.black54,
                    blurRadius: 2,
                  )],
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: TextField(
                      controller: myController,

                      minLines: 1,
                      maxLines: 3,
                      maxLength: commentMaxChars, // MAX CHARACTERS FOR A COMMENT

                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(defaultBorderRadius),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.black26,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.white),
                          hintText: 'Type a comment here...',
                        ),
                    )),

                    const SizedBox(width: 10),

                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.outline),
                        padding: const MaterialStatePropertyAll(EdgeInsets.all(16.0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultBorderRadius),
                            side: BorderSide.none,
                          )
                        ),
                        // Rounded?
                      ),

                      // Add the comment to the post if the user has entered text
                      onPressed: (){ 
                        if(myController.text.isNotEmpty) { 
                          if(replying) {
                            replying = false;
                            context.read<CommentsPageViewModel>().reply(replyingTo, myController.text);
                            myController.clear();
                          } else {
                            context.read<CommentsPageViewModel>().comment(myController.text);
                            myController.clear();
                          }
                        }
                      },
                      child: const Text("Post"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}