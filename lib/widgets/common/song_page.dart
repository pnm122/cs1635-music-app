import 'package:flutter/material.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/track.dart';
import 'package:test_app/viewmodels/common/song_page_view_model.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar.dart';
import 'package:test_app/global_styles.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    Song song = context.watch<SongPageViewModel>().song;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Song"
      ),
      body: Padding(
        padding: const EdgeInsets.all(sectionPadding),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.white70,
                  width: 120,
                  height: 120,
                  // Show album cover if song is a Track with art, otherwise show an icon
                  child: song is Track && song.album.art != ""
                    ? Image.network(song.album.art, fit: BoxFit.cover)
                    : const Center(child: Icon(Icons.music_note, size: 60, color: Colors.black))
                ),
                const SizedBox(width: sectionPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.music_note,
                          size: 24,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          song.name,
                          style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
              
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          song.creator.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),

                    song is Track ? Row(
                      children: [
                        const Icon(
                          Icons.album,
                          size: 20,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          song.album.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ) : Container(),
                  ],
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}