import 'package:flutter/material.dart';
import 'package:test_app/router_constants.dart';
import 'package:test_app/viewmodels/homepage/homepage_view_model.dart';
import 'router.dart' as LocalRouter;
import 'widgets/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

///
///
/// LOOK AT TUTORIAL TO SEE HOW TO ADD TO FAVORITES
///
///

void main() {
  // runApp(ChangeNotifierProvider<HomepageViewModel>(
  //   child: const MyApp(),
  //   create: (_) => HomepageViewModel(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bgColor = const Color.fromARGB(255, 19, 26, 44);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      // home: HomePage(),
      home: (ChangeNotifierProvider<HomepageViewModel>(
        child: const BottomNavigationBarWidget(),
        create: (_) => HomepageViewModel(),
      )),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: homeRoute,

      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        disabledColor: Colors.transparent, // get rid of text box outline (temporary?)
        colorScheme: ColorScheme(
          primary: Colors.white, // go-to text color
          onPrimary: Colors.black,
          secondary: const Color.fromARGB(180, 255, 255, 255), // post text
          onSecondary: Colors.black,
          background: bgColor,
          onBackground: const Color.fromARGB(255, 27, 37, 62), // slightly lighter than background
          error: const Color.fromARGB(255, 214, 46, 46),
          onError: Colors.white,
          surface: const Color.fromARGB(18, 255, 255, 255),
          onSurface: Colors.white,
          outline: Colors.indigo[400],
          brightness: Brightness.dark,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: "Nunito",
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
    );
  }
}

