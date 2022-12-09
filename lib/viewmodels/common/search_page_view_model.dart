import 'package:flutter/cupertino.dart';
import 'package:test_app/mock_data.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/models/song.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/search_constants.dart';

List<User> users = MockData().users;
List<Song> songs = MockData().songs;
List<Album> albums = MockData().albums;

class SearchPageViewModel with ChangeNotifier {
  String _searchType;
  String query = "";
  List _results = List.empty(growable: true);

  SearchPageViewModel(this._searchType) {
    users.sort((a, b) => b.followers.length.compareTo(a.followers.length));
    songs.sort((a, b) => b.covers.length.compareTo(a.covers.length));
    switch(_searchType) {
      case userSearch:
        _results = users;
        break;
      case songSearch:
        _results = songs;
        break;
      case albumSearch:
        _results = albums;
        break;
      default:
        throw Exception("Unknown search type.");
    }
  }

  String get searchType => _searchType;
  List get results => _results;

  void setSearchType(String searchType) {
    _searchType = searchType;
    search(query);
    notifyListeners();
  }

  // TODO: Sort the queries by some metric of popularity
  void search(String query) {
    this.query = query;
    switch(_searchType) {
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
      default:
        throw Exception("Undefined search type.");
    }
    notifyListeners();
  }

}