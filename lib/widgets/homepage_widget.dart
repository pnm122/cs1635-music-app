import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:test_app/widgets/video_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.background,

          // Search Bar
          title: TextField(

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              filled: true,
              fillColor: Colors.black26,

              hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color:Colors.white),
              prefixIcon: const Icon(Icons.search, color:Colors.white),
              hintText: 'Search for a song or profile...',

              enabled: false,
            ),
          ),

          // Tabs between popular and following pages
          bottom: TabBar(
            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            indicatorColor: Theme.of(context).colorScheme.outline,
            tabs: const <Widget>[
              Tab(
                child: Text("Popular"),
              ),
              Tab(
                child: Text("Following"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Popular
            PostView(),

            // Following
            PostView(),
          ],
        ),
      ),
    );
  }
}

class PostView extends StatefulWidget {
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),

        itemBuilder: (context, i) {
          // extra space between each post
          if(i.isOdd) return const SizedBox(height:postGap);

          // Text Post
          // TODO: Turn this into its own widget
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Poster
              // TODO: Turn this into its own widget
              Row(
                children: <Widget>[
                  // Profile
                  TextButton(
                    style: ButtonStyle(
                      // MaterialStateProperty.all means to use that style for all states of the button
                      foregroundColor:MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                      textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelLarge),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    // TODO: Take a user to the profile when they press this button
                    onPressed: null,

                    // TODO: Repalce icon with profile image
                    child: Row(
                        children: const <Widget>[
                          Icon(Icons.account_circle),
                          SizedBox(width: 5),
                          Text("User Name"),
                        ]
                    ),
                  ),

                  const SizedBox(width: 5),

                  // Following button
                  OutlinedButton(
                    style: ButtonStyle(
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
                    onPressed: null,
                    child: const Text("Follow"),
                  ),
                ],
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Content (Text Post)
              Container(
                padding: const EdgeInsets.all(postPadding),
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  color: Theme.of(context).colorScheme.surface,
                ),

                // TODO: Decide post style based on where we're pulling post info from
                child: (i/2).floor().isOdd ? Text(
                    "nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed elementum tempus egestas sed sed risus pretium quam vulputate dignissim",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary)
                ) : CustomVideoPlayer(
                  videoPlayerController: VideoPlayerController.network("https://player.vimeo.com/external/430014215.sd.mp4?s=2c2fedb46aa038dcc4664ad42ef6a0e002bf312a&profile_id=165&oauth2_token_id=57447761"),
                ),
              ),

              // Padding between elements
              const SizedBox(height: postSectionMargin),

              // Interaction icons
              Row(
                children: <Widget>[
                  // Favorite button
                  // TODO: Update favorited posts and icon state if clicked
                  // TODO: Initial icon state based on if the user already liked the post or not
                  Column(
                    children: <Widget>[
                      const IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        isSelected: false,
                        onPressed: null,
                        icon: Icon(Icons.favorite_outline, color: Colors.white),
                      ),
                      Text(
                        "175",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: "Nunito"),
                      ),
                    ],
                  ),

                  // Gap between icons
                  const SizedBox(width: 8),

                  // Comment button
                  // TODO: Take you to the post's comment page when clicked
                  Column(
                    children: <Widget>[
                      const IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: null,
                        icon: Icon(Icons.comment, color: Colors.white),
                      ),
                      Text(
                        "83",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: "Nunito"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}

class SongList extends StatefulWidget {
  // "=> statement" is shorthand for "{ return statement; }"
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),
        itemBuilder: /*1*/ (context, i) {
          // margin between list items
          if (i.isOdd) return const Divider();

          const descriptionPadding = 3.0;

          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Image.network("http://cdn.onlinewebfonts.com/svg/img_296254.png", height:75),

                // padding between elements
                const SizedBox(width:10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // Song Title
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.music_note),
                          ),
                          TextSpan(
                            text: "Song Title",
                          ),
                        ],
                      ),
                    ),

                    // Padding Element
                    const SizedBox(height: descriptionPadding),

                    // Artist Name
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6,
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.person),
                          ),
                          TextSpan(
                            text: "Artist Name",
                          ),
                        ],
                      ),
                    ),

                    // Padding Element
                    const SizedBox(height: descriptionPadding),

                    // Video Recording Count
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.camera_alt, size:14),
                          ),
                          TextSpan(
                            text: "100",
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
    );
  }
}