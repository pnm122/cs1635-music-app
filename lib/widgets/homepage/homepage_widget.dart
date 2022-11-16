import 'package:flutter/material.dart';
import 'package:test_app/global_styles.dart';
import 'package:test_app/widgets/homepage/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).colorScheme.background,

          // Search Bar
          title: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              filled: true,
              fillColor: Colors.black26,
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              hintText: 'Search for a song or profile...',
              enabled: false,
            ),
          ),

          // Tabs between popular and following pages
          bottom: TabBar(
            unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
            labelStyle: Theme.of(context).textTheme.labelLarge,
            indicatorColor: Theme.of(context).colorScheme.outline,
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
            // Popular
            PostView(isPopularPosts: true,),

            // Following
            PostView(isPopularPosts: false,),
          ],
        ),
      ),
    );
  }
}
