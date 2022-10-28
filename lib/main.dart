import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
      theme: ThemeData (
        fontFamily: "Roboto",
        //brightness: Brightness.dark,
        //dividerColor:const Color.fromARGB(255, 33, 33, 33),
        //iconTheme:const IconThemeData(color:Colors.white),
        colorScheme:const ColorScheme.dark(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  // "=> statement" is shorthand for "{ return statement; }"
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        // padding around the entire list
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          // margin between list items
          if (i.isOdd) return const Divider();
          
          const descriptionPadding = 3.0;

          return Container(
            color: const Color.fromRGBO(255, 255, 255, 0.02),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Image.network("https://cdn0.iconfinder.com/data/icons/audio-vol-1b/100/1-41-512.png", height:75),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // Song Title
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.music_note, size:20),
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
                      text: const TextSpan(
                        style: TextStyle(fontSize: 18),
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.person, size:20),
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
                      text: const TextSpan(
                        style: TextStyle(fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.camera_alt, size:15),
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

          /*
          return ListTile(
            tileColor: Color.fromRGBO(235, 235, 235, 1),
            contentPadding: const EdgeInsets.all(16.0),
            leading: const Icon(Icons.library_music, color:Colors.black, size:70),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.music_note, size:20, color: Colors.black),
                      ),
                      TextSpan(
                        text: "Song Title",
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.person, size:20, color: Colors.black),
                      ),
                      TextSpan(
                        text: "Artist Name",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          */
        },
      );
    }
  }