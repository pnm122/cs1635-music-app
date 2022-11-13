import 'package:flutter/material.dart';
import 'package:test_app/widgets/user_profile_page/user_profile_listening_page.dart';

import 'edit_profile_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
            centerTitle: true,

            title: const Text(
              "Your Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(140),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                          height: 100,
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                        Column(
                          children: const [
                            Text("Username",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text("Bio",
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(children: const [
                      Spacer(),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: null,
                          icon: Icon(Icons.edit, color: Colors.white),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: null,
                        child: Text(
                            "100K Followers",
                            style: TextStyle(color: Colors.white)
                        )
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                            "41 Following",
                            style: TextStyle(color: Colors.white)
                        )
                      ),
                      Spacer(),
                    ],),
                    const TabBar(
                        tabs: <Widget>[
                          Tab(
                              child: Text("Posts")
                          ),
                          Tab(
                              child: Text("Listening")
                          )
                        ]
                    )
                  ],
                )
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              // Posts
              Text("Post"),

              // Listening
              UserProfileListeningPage(),
            ],
          ),
      )
    );
  }
}
