import 'package:flutter/material.dart';

class UserProfileListeningPage extends StatelessWidget {
  const UserProfileListeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return(Column(
      children: [
        SizedBox(height: 10,),
        Column(
          children: [
            Text(
              "Username's Favorites",
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
                const Image(
                  height: 100,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.music_note, color: Colors.white,)
                      ),
                      TextSpan(
                          text: "Song name  "
                      )
                    ]
                )),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: "Artist name  "
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
                const Image(
                  height: 100,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.album, color: Colors.white,)
                      ),
                      TextSpan(
                          text: "Album name"
                      )
                    ]
                )),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: "Artist name  "
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
                const Image(
                  height: 100,
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                ),
                RichText(text: const TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(Icons.person, color: Colors.white,)
                      ),
                      TextSpan(
                          text: "Artist name  "
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
            const Text(
              "Username's Listening History",
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