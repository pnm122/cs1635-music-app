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
  updateComments() {
    setState((){context.read<CommentsPageViewModel>().comment(widget.post, myController.text);});
    myController.clear();
  }

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
          return Column(
            children: [
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
                                  onPressed: () { setState((){context.read<CommentsPageViewModel>().like(widget.post.comments[i]);}); },
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
                  
                              // TODO: Replying
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],

                // TODO: CHILD COMMENTS

                // TODO: DELETE COMMENT OPTION IF IT'S YOURS

              ),

              const SizedBox(height: sectionPadding),
            ],
          );
        },
      ),

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
                  updateComments(); 
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