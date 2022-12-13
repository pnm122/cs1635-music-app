import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/router_constants.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/widgets/common/misc_widgets.dart';
import '../../models/artist.dart';
import '../../viewmodels/user_profile_page/user_profile_page_view_model.dart';

class UserProfileListeningPage extends StatelessWidget {
  final UserProfilePageViewModel viewModel;

  const UserProfileListeningPage({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {

    var currentUser = context.watch<UserProfilePageViewModel>().currentUser;
    var user = context.watch<UserProfilePageViewModel>().user;
    Song? favoriteSong = user.profile.favoriteSong;
    Album? favoriteAlbum = user.profile.favoriteAlbum;
    Artist? favoriteArtist = user.profile.favoriteArtist;

    return(Column(
      children: [
        const SizedBox(height: 10,),
        Column(
          children: [
            Text(
              "${user.name}'s Favorites",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    const Text("Song"),
                    Visibility(
                        child: IconButton(
                            onPressed: (){ Navigator.pushNamed(context, searchRoute, arguments: [[songSearch], settingFavoriteBehavior, viewModel]); },
                            icon: const Icon(Icons.edit, color: Colors.white)
                        ),
                      visible: currentUser == user,
                    ),
                  ],
                ),
                AlbumCoverOfSong(song: favoriteSong, size: 100),
                RichText(text: TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(Icons.music_note, color: Colors.white,)
                      ),
                      TextSpan(
                          text: favoriteSong == null ? "Song name" : favoriteSong.name,
                          style: const TextStyle(fontSize: 12)
                      )
                    ]
                )),
                RichText(text: TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: favoriteSong == null ? 'Artist name' : favoriteSong.creator.name,
                          style: const TextStyle(fontSize: 12)
                      )
                    ]
                )),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    const Text("Album"),
                    Visibility(
                        child: IconButton(
                            onPressed: (){ Navigator.pushNamed(context, searchRoute, arguments: [[albumSearch], settingFavoriteBehavior, viewModel]); },
                            icon: const Icon(Icons.edit, color: Colors.white)
                        ),
                      visible: currentUser == user,
                    )
                  ],
                ),
                AlbumCoverOfAlbum(album: favoriteAlbum, size: 100),
                RichText(text: TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(Icons.album, color: Colors.white,)
                      ),
                      TextSpan(
                          text: favoriteAlbum == null ? 'Album name' : favoriteAlbum.name,
                          style: const TextStyle(fontSize: 12)
                      )
                    ]
                )),
                RichText(text: TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: favoriteAlbum == null ? 'Artist name' : favoriteAlbum.artist.name,
                          style: const TextStyle(fontSize: 12)
                      )
                    ]
                )),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    const Text("Artist"),
                    Visibility(
                        child: IconButton(
                            onPressed: (){ Navigator.pushNamed(context, searchRoute, arguments: [[artistSearch], settingFavoriteBehavior, viewModel]); },
                            icon: const Icon(Icons.edit, color: Colors.white)
                        ),
                      visible: currentUser == user,
                    )
                  ],
                ),
                ArtistImage(artist: favoriteArtist, size: 100),
                RichText(text: TextSpan(
                    children: [
                      const WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: favoriteArtist == null ? 'Artist name' : favoriteArtist.name,
                          style: const TextStyle(fontSize: 12)
                      )
                    ]
                )),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.music_note, color: Colors.transparent,)
                      ),
                      TextSpan(
                          text: ""
                      )
                    ]
                )),

              ],
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 30,),
        Column(
          children: [
            Text(
              "${user.name}'s Listening History",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              style: ButtonStyle(
                // MaterialStateProperty.all means to use that style for all states of the button
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.labelMedium),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              ),
              onPressed: null,
              child: const Text("  Link Your Spotify Account  "),
            ),
          ],
        ),
      ],
    ));
  }
}