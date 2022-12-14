import 'package:flutter/material.dart';

/// Custom App Bar to maintain the same AppBar styling across pages.
/// You don't need to provide any styling to the widgets (i.e. padding, icon styling) because it will be done automatically by this widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, this.actions, this.tabs, this.onTapTabBar, this.showBackButton = true, this.shape});
  /// Title of the App Bar. Can be a String if you just want a title, or a Widget if you want to do something more complex
  final title;
  /// Buttons on the right side of the App Bar
  final List<Widget>? actions;
  /// Any tabs you might want to put on the bottom of the App Bar 
  final List<Tab>? tabs; 
  /// If applicable, showBackButton is whether or not there should be a back button in the App Bar.
  /// Defaults to true
  bool showBackButton;

  /// Shape of the app bar. Only used by comments page currently to make the top rounded
  final ShapeBorder? shape;

  /// Function to call when tapping a tab. Parameter is the index of the tab tapped
  ValueChanged<int>? onTapTabBar;

  @override
  Widget build(BuildContext context) {
    // Add padding to the end of the list
    if(actions != null) {
      var padding = const Padding(padding: EdgeInsets.all(8.0));
      actions!.insert(0, padding);
      actions!.add(padding);
    }

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shadowColor: Colors.black54,
      elevation: 10.0,
      automaticallyImplyLeading: showBackButton,
      titleSpacing: 8,
      centerTitle: true,
      title: title is String ? Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      ) : title,
      actions: actions,
      bottom: tabs == null ? null : TabBar(
        onTap: onTapTabBar,
        indicatorColor: Theme.of(context).colorScheme.outline,
        tabs: tabs!,
      ),
      shape: shape,
    );
  }
  
  // Sets the preferred size of the app bar to a regular appbar's preferred height + the tab bar's preferred height if there are tabs
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + (tabs == null ? 0 : const TabBar(tabs: []).preferredSize.height));
}