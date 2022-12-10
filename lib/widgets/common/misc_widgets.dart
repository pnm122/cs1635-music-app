import 'package:flutter/material.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/artist.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/track.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.imageURL, this.radius = 16});
  final String imageURL;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: radius,
      backgroundImage: imageURL == "" ? null : NetworkImage(imageURL),
      child: imageURL == "" ? const Icon(Icons.person, size: 16) : null,
    );
  }
}

class ArtistImage extends StatelessWidget {
  const ArtistImage({super.key, required this.artist, this.size = 64});

  final Artist? artist;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: size,
      height: size,
      // Show album cover if song is a Track with art, otherwise show an icon
      child: artist != null && artist!.image != ""
        ? Image.network(
          artist!.image, 
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.person, size: size / 2, color: Colors.black));
          },
        )
        : Center(child: Icon(Icons.person, size: size / 2, color: Colors.black))
    );
  }
}

class AlbumCoverOfSong extends StatelessWidget {
  const AlbumCoverOfSong({super.key, required this.song, this.size = 64});

  /// Song to get the cover of
  final Song? song;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: size,
      height: size,
      // Show album cover if song is a Track with art, otherwise show an icon
      child: song != null && song is Track && (song as Track).album.art != ""
        ? Image.network(
          (song as Track).album.art, 
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.album, size: size / 2, color: Colors.black));
          },
        )
        : Center(child: Icon(Icons.album, size: size / 2, color: Colors.black))
    );
  }
}

class AlbumCoverOfAlbum extends StatelessWidget {
  const AlbumCoverOfAlbum({super.key, required this.album, this.size = 64});

  /// Album to get the cover of
  final Album? album;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      width: size,
      height: size,
      child: album != null && album!.art != ""
        ? Image.network(
          album!.art, 
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(child: Icon(Icons.album, size: size / 2, color: Colors.black));
          },
        )
        : Center(child: Icon(Icons.album, size: size / 2, color: Colors.black))
    );
  }
}