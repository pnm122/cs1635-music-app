import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/viewmodels/comments_page_view_model.dart';
import '../viewmodels/homepage_view_model.dart'; // TODO: FIX THIS; really probably shouldn't be doing this but how else can I access the current user?

class Comments extends StatefulWidget {
  const Comments({super.key, required this.post});
  final dynamic post;

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

  // TODO: Find a way to do this with context.watch?
  // TODO: Handle replies
  // Add a comment to the related post from the current user with the text entered into the TextField
  // Notify UI that the state has changed
  // Clear the text from the TextField
  createComment() {
    setState((){context.read<CommentsPageViewModel>().comment(widget.post, myController.text);});
    myController.clear();
  }

  deleteComment(c) {
    setState((){context.read<CommentsPageViewModel>().deleteComment(widget.post, c);});
  }

  createReply() {
    setState((){context.read<CommentsPageViewModel>().reply(replyingTo, myController.text);});
    myController.clear();
  }

  deleteReply(c, r)
  {
    setState((){context.read<CommentsPageViewModel>().deleteReply(c, r);});
  }

  // TODO: deleteReply

  bool replying = false;
  dynamic replyingTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,

        leading: const BackButton(),

        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight:FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(sectionPadding),
        itemCount: widget.post.comments.length,

        // Each item is a comment + any replies
        itemBuilder:(context, i) {
          dynamic c = widget.post.comments[i];

          // Container for comment + replies
          return Column(
            children: [
              // Main comment
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 
                  // TODO: Bring to user profile
                  c.commenter.image == ""
                  ? const Icon(Icons.account_circle, size: 32)
                  : Image.asset(c.commenter.image, height: 32, width: 32),

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
                                    setState((){context.read<CommentsPageViewModel>().like(widget.post.comments[i]);}); },
                                  icon: c.likedBy.contains(currentUser)
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
                            if(identical(c.commenter, currentUser)) TextButton(
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
                                          deleteComment(c);
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

                // TODO: CHILD COMMENTS

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
                            r.commenter.image == ""
                            ? const Icon(Icons.account_circle, size: 32)
                            : Image.asset(r.commenter.image, height: 32, width: 32),

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
                                              setState((){context.read<CommentsPageViewModel>().like(c.childComments[j]);}); },
                                            icon: r.likedBy.contains(currentUser)
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
                                      if(identical(r.commenter, currentUser)) TextButton(
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
                                                    deleteReply(c, r);
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
      
      // Tell the user that they're replying to a comment if they are
      bottomSheet: replying ? Container(
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
      ) : null,

      // Comment creating text field and button
      bottomNavigationBar: Container(
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
                    createReply();
                  } else {
                    createComment(); 
                  }
                }
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}