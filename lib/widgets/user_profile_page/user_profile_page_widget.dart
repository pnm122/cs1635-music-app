import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/common/misc_widgets.dart';
import 'package:test_app/widgets/user_profile_page/user_profile_listening_page_widget.dart';
import '../../models/user.dart';
import '../../router_constants.dart';
import '../../search_constants.dart';
import '../../user_profile_page_edit_arguments.dart';
import '../../viewmodels/homepage/post_view_model.dart';
import '../../viewmodels/user_profile_page/user_profile_page_view_model.dart';
import '../common/post_widget.dart';

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
    String followersCnt = context.watch<UserProfilePageViewModel>().followersCnt;
    String followingCnt = context.watch<UserProfilePageViewModel>().followingCnt;
    var currentUser = context.watch<UserProfilePageViewModel>().currentUser;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            shadowColor: Colors.transparent,
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,

            title: Visibility(child:
              const Text(
                "Your Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              visible: viewModel.editAvailable,
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(140),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        UserImage(imageURL: user.image, radius: 50),
                        const Spacer(),
                        SizedBox(
                          width: 220,
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(user.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                                ),
                              ),
                              Text(user.profile.bio,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    Row(children: [
                      const Spacer(),
                      Visibility(
                        child:
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Navigator.pushNamed(context, editProfileRoute, arguments: UserProfilePageEditArguments(viewModel: viewModel, user: user));
                            },
                            icon: const Icon(Icons.edit, color: Colors.white),
                          ),
                        visible: viewModel.editAvailable,
                      ),
                      Visibility(
                        child:
                        // Following button
                        OutlinedButton(
                            style: currentUser.following.contains(user)
                                ? ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.outline),
                              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                  width: 1,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 8)),
                            )
                                : ButtonStyle(
                              // MaterialStateProperty.all means to use that style for all states of the button
                              foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.labelMedium),
                              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            ),
                            onPressed: () {
                              context.read<UserProfilePageViewModel>().follow(user);
                            },
                            child: currentUser.following.contains(user)
                                ? const Text("Following")
                                : const Text("Follow")
                        ),
                        visible: !viewModel.editAvailable,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () { Navigator.pushNamed(context, searchRoute, arguments: [[userSearch], followersBehavior, user]); },
                        child: Text("$followersCnt Followers"),
                      ),
                      TextButton(
                        onPressed: () { Navigator.pushNamed(context, searchRoute, arguments: [[userSearch], followingBehavior, user]); },
                        child: Text("$followingCnt Following")
                      ),
                      const Spacer(),
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
              // refer to pierce_explanations for why this has to be a separate widget (or at least why I think it does)
              const UserPosts(),

              // Listening
              UserProfileListeningPage(viewModel: viewModel,),
            ],
          ),
      )
    );
  }
}

class UserPosts extends StatelessWidget {
  const UserPosts({super.key});

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = PostViewModel(posts: context.watch<UserProfilePageViewModel>().posts, isProfilePage: true);
    return ChangeNotifierProvider<PostViewModel>(
      child: PostView(postViewModel: postViewModel),
      create: (_) => postViewModel,
    );
  }
}
