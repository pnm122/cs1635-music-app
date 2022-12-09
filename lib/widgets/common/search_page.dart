import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/search_constants.dart';
import 'package:test_app/viewmodels/common/search_page_view_model.dart';
import 'package:test_app/widgets/common/custom_app_bar.dart';
import 'package:test_app/viewmodels/common/song_page_view_model.dart';
import 'package:test_app/widgets/common/search_tiles.dart';

// TODO: Allow this search page to be flexible for the other search use cases
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          title: SearchBar(),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); },
              child: const Text("Cancel"),
            )
          ],
          tabs: const [
            Tab(
              child: Text("Users"),
            ),
            Tab(
              child: Text("Songs"),
            )
          ],
          onTapTabBar: (index) {
            // This will
            index == 0 ? context.read<SearchPageViewModel>().setSearchType(userSearch)
                       : context.read<SearchPageViewModel>().setSearchType(songSearch);
          },
        ),
        body: const TabBarView(
          // Don't allow swiping between tabs because the results won't update properly
          // I tried several different ways of showing results but this was unfortunately the most functional and it's good enough for now
          physics: NeverScrollableScrollPhysics(),
          children: [
            SearchResults(),
            SearchResults(),
          ],
        ),
      ),
    );
  }
}

/// Search bar for the search pages
/// Every edit to the search query changes the results in the viewmodel, automatically updating this view
class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (query) {
        context.read<SearchPageViewModel>().search(query);
        setState(() {}); // Tell UI to update since the clear search button could appear/disappear
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isEmpty ? null : IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _controller.clear();
            context.read<SearchPageViewModel>().search("");
            setState(() {}); // Tell UI to update since the clear search button should disappear
          },
        ),
        hintText: "Search for a user or song...",
        isDense: true, // get rid of the extra padding flutter likes to put in
        contentPadding: const EdgeInsets.all(12.0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}

/// Results for search queries
class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    List results = context.watch<SearchPageViewModel>().results;
    String searchType = context.watch<SearchPageViewModel>().searchType;
    
    return results.isNotEmpty ? ListView.builder(
      itemCount: results.length,
      itemBuilder:(context, index) {
        switch(searchType) {
          case userSearch:
            return UserTile(user: results[index]);
          case songSearch:
            return SongTile(song: results[index]);
          case albumSearch:
            return AlbumTile(album: results[index]);
          default:
            return const Center(child: Text("Undefined search"));
        }
      },
    ) : const Center(child: Text("No results found."));
  }
}