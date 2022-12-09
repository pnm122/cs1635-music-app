import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/user_profile_page/user_profile_listening_page_widget.dart';

import '../../models/artist.dart';
import '../../models/user.dart';
import '../../router_constants.dart';
import '../../user_profile_page_edit_arguments.dart';
import '../../viewmodels/user_profile_page/user_profile_page_view_model.dart';
import 'edit_profile_page_widget.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});
  @override
  State<UserProfilePage> createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {

    var viewModel = context.watch<UserProfilePageViewModel>();
    final User user = context.watch<UserProfilePageViewModel>().user;
    final String followersCnt = context.watch<UserProfilePageViewModel>().followersCnt;
    final String followingCnt = context.watch<UserProfilePageViewModel>().followingCnt;

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
                        Spacer(),
                        Image(
                          height: 100,
                          image: NetworkImage(user.image),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 220,
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(user.name,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                ),
                              ),
                              Text(user.profile.bio,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(children: [
                      Spacer(),
                      Visibility(
                        child:
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              Navigator.pushNamed(context, editProfileRoute, arguments: UserProfilePageEditArguments(viewModel: viewModel, user: user));
                            },
                            icon: Icon(Icons.edit, color: Colors.white),
                          ),
                        visible: viewModel.editAvailable,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: null,
                        child: Text(
                            "${followersCnt} Followers",
                            style: TextStyle(color: Colors.white)
                        )
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                            "${followingCnt} Following",
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
          body: TabBarView(
            children: <Widget>[
              // Posts
              Text("Post"),

              // Listening
              UserProfileListeningPage(viewModel: viewModel,),
            ],
          ),
      )
    );
  }
}
