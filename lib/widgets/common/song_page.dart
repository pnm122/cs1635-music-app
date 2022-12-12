import 'package:flutter/material.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/track.dart';
import 'package:test_app/viewmodels/common/song_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/homepage/post_view_model.dart';
import 'package:test_app/widgets/common/misc_widgets.dart';
import 'package:test_app/widgets/common/post_widget.dart';
import 'custom_app_bar.dart';
import 'package:test_app/global_styles.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    Song song = context.watch<SongPageViewModel>().song;
    PostViewModel postViewModel = PostViewModel(posts: song.covers);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Song"
      ),
      body: Padding(
        padding: const EdgeInsets.all(sectionPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  AlbumCoverOfSong(song: song, size: 120),
                  const SizedBox(width: sectionPadding),
                  // Flexible to allow wrapping text
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.music_note,
                              size: 24,
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                song.name,
                                style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                                  
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                song.creator.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                            
                        song is Track ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.album,
                              size: 20,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                song.album.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
                              ),
                            ),
                          ],
                        ) : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: sectionPadding),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.video_camera_back,
                        size: 16,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        "Recordings",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              ChangeNotifierProvider(
                create: (context) => postViewModel,
                child: PostView(postViewModel: postViewModel),
              )
            ],
          ),
        ),
      ),
    );
  }
}