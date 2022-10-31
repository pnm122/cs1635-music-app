import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar_widget.dart';

const sectionPadding = 16.0; // padding around each section
const postPadding = 16.0; // padding on the inside of each post
const defaultBorderRadius = 10.0; // border radius of outline of each post
const postSectionMargin = 10.0; // Margin between poster, content, and interactions on a post
const postGap = 32.0; // Extra margin between posts


/**
 * 
 * 
 * LOOK AT TUTORIAL TO SEE HOW TO ADD TO FAVORITES
 * 
 * 
 */


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
      // home: HomePage(),
      home: BottomNavigationBarWidget(),

      theme: ThemeData (
        scaffoldBackgroundColor: bgColor,

        colorScheme: ColorScheme( 
          primary: Colors.white,
          onPrimary: Colors.black,

          secondary: const Color.fromARGB(180, 255, 255, 255),
          onSecondary: Colors.black,

          background: bgColor,
          onBackground: Colors.white,

          error: const Color.fromARGB(255, 214, 46, 46),
          onError: Colors.white,
 
          surface: const Color.fromARGB(18, 255, 255, 255),
          onSurface:Colors.white,

          outline: Colors.indigo[400],
          
          brightness: Brightness.light,
        ),

        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Nunito", bodyColor: Colors.white, displayColor: Colors.white),

      ),
    );
  }
}

