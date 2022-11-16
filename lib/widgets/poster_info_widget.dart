import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/homepage_view_model.dart';

class PosterInfo extends StatefulWidget {
  const PosterInfo({super.key, required this.post});
  final dynamic post;

  @override
  State<PosterInfo> createState() => _PosterInfoState();
}

class _PosterInfoState extends State<PosterInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Profile
        TextButton(
          style: ButtonStyle(
            // MaterialStateProperty.all means to use that style for all states of the button
            foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary),
            textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.labelLarge),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          // TODO: Take a user to the profile when they press this button
          onPressed: null,

          child: Row(children: <Widget>[
            widget.post.poster.image == ""
                  ? const Icon(Icons.account_circle, size: 32)
                  : Image.network(widget.post.poster.image, height: 32, width: 32),
            const SizedBox(width: 5),
            Text(widget.post.poster.name),
          ]),
        ),

        const SizedBox(width: 5),

        // Following button
        OutlinedButton(
          style: HomepageViewModel.currentUser.following.contains(widget.post.poster)
            ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.outline),
              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
              ),
              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
            )
            : ButtonStyle(
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
          onPressed: () { 
            setState((){ context.read<HomepageViewModel>().follow(widget.post.poster); });
          },
          child: HomepageViewModel.currentUser.following.contains(widget.post.poster)
            ? const Text("Following")
            : const Text("Follow")
        ),
      ],
    );
  }
}
