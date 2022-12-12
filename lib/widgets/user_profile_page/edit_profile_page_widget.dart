import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../viewmodels/user_profile_page/user_profile_page_view_model.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePage(user);
}

class _EditProfilePage extends State<EditProfilePage> {
  late final usernameController;
  late final bioController;

  _EditProfilePage(User user) {
    usernameController = TextEditingController(text: user.name);
    bioController = TextEditingController(text: user.profile.bio);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,

          leading: const BackButton(color: Colors.white,),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<UserProfilePageViewModel>().edit(usernameController.text, bioController.text);
                },
                icon: const Icon(Icons.save, color: Colors.white,),
            )
          ],
          title: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight:FontWeight.bold),
          ),
        ),
      body: Column(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.change_circle, color: Colors.white,),
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                width: 100,
                child: const Text("Username", style: TextStyle(fontSize: 20),),
              ),
              const Spacer(),
              Container(
                width: 200,
                child: Form(child: TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  maxLength: 15,
                )),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Container(
                width: 100,
                child: const Text("Bio", style: TextStyle(fontSize: 20),),
              ),
              const Spacer(),
              Container(
                width: 200,
                child: Form(child: TextFormField(
                  controller: bioController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 50,
                )),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}