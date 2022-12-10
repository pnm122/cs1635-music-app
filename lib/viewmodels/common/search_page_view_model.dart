import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/artist.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/search_constants.dart';

List<User> users = MockData().users;
List<Song> songs = MockData().songs;
List<Album> albums = MockData().albums;
List<Artist> artists = MockData().artists;

class SearchPageViewModel with ChangeNotifier {
  // List of search types to show on this search page
  // Options can be found in search_constants
  List<String> _searchTypes;
  // Search type that the page is currently on
  String _currentSearchType = "";
  // Whether we are setting a favorite on the search page that goes with this viewmodel
  bool _settingFavorite = false;
  // Whether we are attaching a song to a post on the search page that goes with this viewmodel
  bool _attachingSong = false;
  String query = "";
  List _results = List.empty(growable: true);

  String searchBehavior;

  SearchPageViewModel(this._searchTypes, this.searchBehavior) {
    _currentSearchType = _searchTypes[0];
    users.sort((a, b) => b.followers.length.compareTo(a.followers.length));
    songs.sort((a, b) => b.covers.length.compareTo(a.covers.length));
    switch(_currentSearchType) {
      case userSearch:
        _results = users;
        break;
      case songSearch:
        _results = songs;
        break;
      case albumSearch:
        _results = albums;
        break;
      case artistSearch:
        _results = artists;
        break;
      default:
        throw Exception("Unknown search type.");
    }

    switch(searchBehavior) {
      case settingFavoriteBehavior:
        _settingFavorite = true;
        break;
      case attachingSongBehavior:
        _attachingSong = true;
        break;
      case followersBehavior:
        _results = MockData().currentUser.followers;
        break;
      case followingBehavior:
        _results = MockData().currentUser.following;
      // implied default is homepage
    }
  }

  List<String> get searchTypes => _searchTypes;
  String get currentSearchType => _currentSearchType;
  bool get settingFavorite => _settingFavorite;
  bool get attachingSong => _attachingSong;
  List get results => _results;

  set currentSearchType(String searchType) {
    _currentSearchType = searchType;
    search(query);
    notifyListeners();
  }

  void search(String query) {
    this.query = query;

    // Different search behavior for followers and following searches
    if(searchBehavior == followingBehavior) {
      _results = MockData().currentUser.following.where((user) => user.name.toUpperCase().contains(query.toUpperCase())).toList();
      _results.sort((a, b) => b.followers.length.compareTo(a.followers.length));
      notifyListeners();
      return;
    } else if(searchBehavior == followersBehavior) {
      _results = MockData().currentUser.followers.where((user) => user.name.toUpperCase().contains(query.toUpperCase())).toList();
      _results.sort((a, b) => b.followers.length.compareTo(a.followers.length));
      notifyListeners();
      return;
    }

    switch(_currentSearchType) {
      case userSearch: 
        _results = users.where((user) => user.name.toUpperCase().contains(query.toUpperCase())).toList();
        // Sort the results by # of followers
        _results.sort((a, b) => b.followers.length.compareTo(a.followers.length));
        break;
      case songSearch: 
        _results = songs.where((song) => song.name.toUpperCase().contains(query.toUpperCase())).toList();
        // Sort the results by # of covers
        _results.sort((a, b) => b.covers.length.compareTo(a.covers.length));
        break;
      case albumSearch: 
        // No sorting for albums. Could do a metric where you add up the number of total covers in an album and store that number with each album
        // Not really worth it if you ask me lol
        _results = albums.where((album) => album.name.toUpperCase().contains(query.toUpperCase())).toList();
        break;
      case artistSearch: 
        // No sorting for artists either
        _results = artists.where((artist) => artist.name.toUpperCase().contains(query.toUpperCase())).toList();
        break;
      default:
        throw Exception("Undefined search type.");
    }
    notifyListeners();
  }

}