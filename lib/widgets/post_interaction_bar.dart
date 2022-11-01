import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostInteraction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        // Favorite button
        // TODO: Update favorited posts and icon state if clicked
        // TODO: Initial icon state based on if the user already liked the post or not
        Column(
          children: <Widget>[
            const IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              isSelected: false,
              onPressed: null,
              icon: Icon(Icons.favorite_outline, color: Colors.white),
            ),
            Text(
              "175",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: "Nunito"),
            ),
          ],
        ),

        // Gap between icons
        const SizedBox(width: 8),

        // Comment button
        // TODO: Take you to the post's comment page when clicked
        Column(
          children: <Widget>[
            const IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: null,
              icon: Icon(Icons.comment, color: Colors.white),
            ),
            Text(
              "83",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: "Nunito"),
            ),
          ],
        ),
      ],
    );
  }
}