import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  final bgColor = const Color.fromARGB(255, 19, 26, 44);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),

      theme: ThemeData (
        scaffoldBackgroundColor: bgColor,
        
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          primaryColorDark: Colors.indigo[700],
          accentColor: const Color.fromARGB(255, 241, 247, 255),
          cardColor: const Color.fromARGB(25, 255, 255, 255),
          backgroundColor: bgColor,
          errorColor: const Color.fromARGB(255, 214, 46, 46),
          brightness: Brightness.light,
        ),

        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Nunito", bodyColor: Colors.white, displayColor: Colors.white),

      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final sidePadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,

          title: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color:Colors.white),
              prefixIcon: const Icon(Icons.search, color:Colors.white),
              hintText: 'Search for a song or profile...',

              enabled: false,
            ),
          ),

          bottom: TabBar(
            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[300]),
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            tabs: const <Widget>[
              Tab(
                child: Text("Popular"),
              ),
              Tab(
                child: Text("Following"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("Tab 1")),
            Center(child: Text("Tab 2")),
          ],
        ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.all(16.0),
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