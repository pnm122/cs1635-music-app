import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';

class SongList extends StatefulWidget {
  // "=> statement" is shorthand for "{ return statement; }"
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding around the entire list
        padding: const EdgeInsets.all(sectionPadding),
        itemBuilder: /*1*/ (context, i) {
          // margin between list items
          if (i.isOdd) return const Divider();

          const descriptionPadding = 3.0;

          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Image.network("http://cdn.onlinewebfonts.com/svg/img_296254.png", height:75),

                // padding between elements
                const SizedBox(width:10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // Song Title
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.music_note),
                          ),
                          TextSpan(
                            text: "Song Title",
                          ),
                        ],
                      ),
                    ),

                    // Padding Element
                    const SizedBox(height: descriptionPadding),

                    // Artist Name
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6,
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.person),
                          ),
                          TextSpan(
                            text: "Artist Name",
                          ),
                        ],
                      ),
                    ),

                    // Padding Element
                    const SizedBox(height: descriptionPadding),

                    // Video Recording Count
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: const [
                          WidgetSpan(
                            child: Icon(Icons.camera_alt, size:14),
                          ),
                          TextSpan(
                            text: "100",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}