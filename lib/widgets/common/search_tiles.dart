import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/artist.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/router_constants.dart';
import 'package:test_app/viewmodels/common/search_page_view_model.dart';
import 'package:test_app/viewmodels/user_profile_page/user_profile_page_view_model.dart';
import 'package:test_app/widgets/common/misc_widgets.dart';

const double tileImageRadius = 32.0;
const EdgeInsets tilePadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);
const Color secondaryTileColor = Colors.white70;
const SizedBox tileColumnGap = SizedBox(width: 12.0);

class SearchResultTile extends StatefulWidget {
  const SearchResultTile({super.key, required this.item, required this.leading, required this.contents, required this.onTap});

  // The search item associated with this tile (could be a Song, Album, User, or Artist)
  final item;
  final Widget leading;
  final Widget contents;
  /// Default behavior for tapping on this tile. Overridden if the viewmodel has settingFavorite = true or attachingSong = true
  final VoidCallback onTap;

  @override
  State<SearchResultTile> createState() => _SearchResultTileState();
}

class _SearchResultTileState extends State<SearchResultTile> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final bool settingFavorite = context.read<SearchPageViewModel>().settingFavorite;
    final bool attachingSong = context.read<SearchPageViewModel>().attachingSong;
    return InkWell(
      onHover: (hover) {
        hovering = hover;
      },
      onTap: settingFavorite ? () {
        context.read<UserProfilePageViewModel>().setFavorite(
          context.read<SearchPageViewModel>().currentSearchType,
          widget.item,
        );
        Navigator.pop(context);
      } : attachingSong
        ? () {
          // TODO: Write a function to attach a song to a post
          // Should pop the screen off when you click, so I put this in for you
          Navigator.pop(context);
        } 
        : widget.onTap,

      child: Container(
        padding: tilePadding,
        color: hovering ? Theme.of(context).colorScheme.onBackground : Colors.transparent,
        child: Row(
          children: [
            widget.leading,
            tileColumnGap,
            Expanded(
              child: widget.contents,
            ),
            attachingSong || settingFavorite 
              ? Container() // No icon necessary for these pages
              : const Center(child: Icon(Icons.keyboard_arrow_right, color: Colors.white70)),
          ],
        ),
      )
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SearchResultTile(
      item: user,
      onTap: () {
        Navigator.pushNamed(context, profileRoute, arguments: user);
      },
      leading: UserImage(imageURL: user.image, radius: 32),
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( // To allow overflow into multi-line text
            children: [
              Expanded( 
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Text(
            "${user.posts.length} Posts",
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
              Expanded( // To allow overflow into multi-line text
                child: Text(
                  user.followers.length.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return SearchResultTile(
      onTap: () {
        Navigator.pushNamed(context, songRoute, arguments: song);
      },
      item: song,
      leading: AlbumCoverOfSong(song: song),
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.music_note,
                size: 20,
              ),
              const SizedBox(width: 4.0),
              Expanded( // To allow overflow into multi-line text
                child: Text(
                  song.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
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
              Expanded( // To allow overflow into multi-line text
                child: Text(
                  song.creator.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class AlbumTile extends StatelessWidget {
  const AlbumTile({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return SearchResultTile(
      onTap: () {}, // HAS NO DEFAULT BEHAVIOR SINCE THIS ONLY APPEARS ON SETTING PROFILE FAVORITES
      item: album,
      leading: AlbumCoverOfAlbum(album: album),
      contents: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.album,
                size: 20,
              ),
              const SizedBox(width: 4.0),
              Expanded( // To allow overflow into multi-line text
                child: Text(
                  album.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
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
              Expanded( // To allow overflow into multi-line text
                child: Text(
                  album.artist.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: secondaryTileColor),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class ArtistTile extends StatelessWidget {
  const ArtistTile({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return SearchResultTile(
      onTap: () {}, // HAS NO DEFAULT BEHAVIOR SINCE THIS ONLY APPEARS ON SETTING PROFILE FAVORITES
      item: artist, 
      leading: ArtistImage(artist: artist), 
      contents: Text(
        artist.name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}