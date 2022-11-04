import 'package:flutter/material.dart';

class PosterInfo extends StatelessWidget {
  const PosterInfo({super.key});
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

          // TODO: Repalce icon with profile image
          child: Row(children: const <Widget>[
            Icon(Icons.account_circle),
            SizedBox(width: 5),
            Text("User Name"),
          ]),
        ),

        const SizedBox(width: 5),

        // Following button
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
          // TODO: Follow this user when this button is pressed
          onPressed: null,
          child: const Text("Follow"),
        ),
      ],
    );
  }
}
