import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../viewmodels/user_profile_page_view_model.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {

  // final usernameController = TextEditingController();
  //
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   usernameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,

          leading: const BackButton(color: Colors.white,),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.save, color: Colors.white,))
          ],
          title: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight:FontWeight.bold),
          ),
        ),
      body: Column(
        children: [
          IconButton(onPressed: null, icon: Icon(Icons.change_circle, color: Colors.white,),),
          Row(
            children: [
              Spacer(),
              Container(
                width: 100,
                child: Text("Username", style: TextStyle(fontSize: 20),),
              ),
              Spacer(),
              Container(
                width: 200,
                child: Form(child: TextFormField(
                  decoration: InputDecoration(

                  ),
                  keyboardType: TextInputType.name,
                  maxLength: 15,
                  onChanged: (text) {
                    setState(() {
                      context.watch()<UserProfilePageViewModel>().user.name;
                    });
                  },
                )),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Spacer(),
              Container(
                width: 100,
                child: Text("Bio", style: TextStyle(fontSize: 20),),
              ),
              Spacer(),
              Container(
                width: 200,
                child: Form(child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 100,
                )),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}