import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/artist.dart';
import '../../models/user.dart';
import '../../viewmodels/user_profile_page_view_model.dart';

class UserProfileListeningPage extends StatelessWidget {
  final UserProfilePageViewModel viewModel;

  const UserProfileListeningPage({super.key, required this.viewModel});
  @override
  Widget build(BuildContext context) {

    var user = viewModel.user;

    return(Column(
      children: [
        SizedBox(height: 10,),
        Column(
          children: [
            Text(
              "${user.name}'s Favorites",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text("Song"),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit, color: Colors.white)
                    )
                  ],
                ),
                Image(
                  height: 100,
                  image: NetworkImage(user.profile.favoriteSong == null ? 'https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png' : user.profile.favoriteSong!.albumName),    // TODO fix
                ),
                RichText(text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.music_note, color: Colors.white,)
                      ),
                      TextSpan(
                          text: user.profile.favoriteSong == null ? "Song name" : user.profile.favoriteSong!.name
                      )
                    ]
                )),
                RichText(text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: user.profile.favoriteSong == null ? 'Artist name' : user.profile.favoriteSong!.creator.name
                      )
                    ]
                )),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text("Album"),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit, color: Colors.white)
                    )
                  ],
                ),
                Image(
                  height: 100,
                  image: NetworkImage(user.profile.favoriteAlbum == null ? 'https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png' : user.profile.favoriteAlbum!.art),
                ),
                RichText(text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.album, color: Colors.white,)
                      ),
                      TextSpan(
                          text: user.profile.favoriteAlbum == null ? 'Album name' : user.profile.favoriteAlbum!.name
                      )
                    ]
                )),
                RichText(text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: user.profile.favoriteAlbum == null ? 'Artist name' : user.profile.favoriteAlbum!.name   // TODO fix name so it shows artist name not album name
                      )
                    ]
                )),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text("Artist"),
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.edit, color: Colors.white)
                    )
                  ],
                ),
                Image(
                  height: 100,
                  image: NetworkImage(user.profile.favoriteArtist == null ? 'https://icons.veryicon.com/png/o/internet--web/55-common-web-icons/person-4.png' : user.profile.favoriteArtist!.image),
                ),
                RichText(text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: user.profile.favoriteArtist == null ? 'Artist name' : user.profile.favoriteArtist!.name
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
            Spacer(),
          ],
        ),
        const SizedBox(height: 30,),
        Column(
          children: [
            Text(
              "${user.name}'s Listening History",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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