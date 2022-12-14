import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/viewmodels/homepage/homepage_view_model.dart';

import 'package:test_app/widgets/user_profile_page/user_profile_page_widget.dart';
import '../viewmodels/user_profile_page/user_profile_page_view_model.dart';
import 'homepage/homepage_widget.dart';
import 'upload_page/upload_page_widget.dart';

import 'package:test_app/global_styles.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ChangeNotifierProvider<HomePageViewModel>(
      child: const HomePage(),
      create: (_) => HomePageViewModel(),
    ),
    const UploadPage(),
    ChangeNotifierProvider<UserProfilePageViewModel>(
      child: const UserProfilePage(),
      create: (_) => UserProfilePageViewModel(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.tertiary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: navBarIconSize,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1 ? const Icon(Icons.upload) : const Icon(Icons.upload_outlined),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2 ? const Icon(Icons.account_circle) : const Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
