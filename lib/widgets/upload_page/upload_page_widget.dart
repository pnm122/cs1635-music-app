import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/upload_page/song_data_view_model.dart';
import 'package:test_app/viewmodels/upload_page/post_upload_view_model.dart';
import 'package:test_app/widgets/upload_page/song_record_widget.dart';
import 'package:test_app/widgets/upload_page/text_post_widget.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonIconSize = 70;
    const double buttonFontSize = 35;
    Color foreground = Theme.of(context).colorScheme.primary;
    Color background = Theme.of(context).colorScheme.background;
    const double outlineWidth = 3.5;

    TextStyle cmnTS = TextStyle(
      color: foreground,
      fontSize: buttonFontSize,
      fontWeight: FontWeight.bold,
    );

    const Size cmnMinSize = Size(200, 105);
    BorderSide btnOutline = BorderSide(width: outlineWidth, color: foreground);
    ButtonStyle cmnStyle = ElevatedButton.styleFrom(
      backgroundColor: background,
      minimumSize: cmnMinSize,
      side: btnOutline,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<SongDataViewModel>(
                    child: const SongRecordWidget(),
                    create: (context) => SongDataViewModel(),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.music_video,
              size: buttonIconSize,
              color: foreground,
            ),
            label: Text('Song', style: cmnTS),
            style: cmnStyle,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<PostUploadViewModel>(
                    child: const TextPostUpload(),
                    create: (context) => PostUploadViewModel(),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
              size: buttonIconSize,
              color: foreground,
            ),
            label: Text('Text', style: cmnTS),
            style: cmnStyle,
          )
        ],
      ),
    );
  }
}
