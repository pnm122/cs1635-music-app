import 'package:flutter/material.dart';
import 'package:test_app/models/track.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/album.dart';

const double tileImageRadius = 32.0;
const EdgeInsets tilePadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);
const Color secondaryTileColor = Colors.white70;
const SizedBox tileColumnGap = SizedBox(width: 12.0);

class UserTile extends StatefulWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover) {
        hovering = hover;
      },
      onTap: () {
        // TODO: Take you to this user's profile
        // TODO: Select this item if setting a favorite in your profile
      },

      child: Container(
        padding: tilePadding,
        color: hovering ? Theme.of(context).colorScheme.onBackground : Colors.transparent,
        child: Row(
          children: [
            CircleAvatar(
              radius: tileImageRadius,
              backgroundImage: widget.user.image == "" ? null : NetworkImage(widget.user.image),
              backgroundColor: secondaryTileColor,
              child: widget.user.image == "" ? const Icon(Icons.person, size: tileImageRadius, color: Colors.black) : null,
            ),
            tileColumnGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${widget.user.posts.length} Posts",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_add_alt_1,
                        size: 16,
                        color: secondaryTileColor,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        widget.user.followers.length.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Center(child: Icon(Icons.keyboard_arrow_right, color: secondaryTileColor)),
          ],
        ),
      )
    );
  }
}

class SongTile extends StatefulWidget {
  const SongTile({super.key, required this.song});

  final Song song;

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover) {
        hovering = hover;
      },
      onTap: () {
        // TODO: Take you to this song's page
        // TODO: Select this item if setting a favorite in your profile or picking it for a post
      },

      child: Container(
        padding: tilePadding,
        color: hovering ? Theme.of(context).colorScheme.onBackground : Colors.transparent,
        child: Row(
          children: [
            Container(
              color: Colors.white70,
              width: 2 * tileImageRadius,
              height: 2 * tileImageRadius,
              // Show album cover if song is a Track with art, otherwise show an icon
              child: widget.song is Track && (widget.song as Track).album.art != ""
                ? Image.network((widget.song as Track).album.art, fit: BoxFit.cover)
                : const Center(child: Icon(Icons.music_note, size: tileImageRadius, color: Colors.black))
            ),
            tileColumnGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        size: 20,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        widget.song.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
            
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 16,
                        color: secondaryTileColor,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        widget.song.creator.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            const Center(child: Icon(Icons.keyboard_arrow_right, color: secondaryTileColor)),
          ],
        ),
      )
    );
  }
}