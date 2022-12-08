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
  SearchPageViewModel(this._searchType);

  String _searchType = userSearch;
  String query = "";
  List _results = List.empty(growable: true);

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
        break;
      case songSearch: 
        _results = songs.where((song) => song.name.toUpperCase().contains(query.toUpperCase())).toList();
        break;
      case albumSearch: 
        _results = albums.where((album) => album.name.toUpperCase().contains(query.toUpperCase())).toList();
        break;
      default:
        throw Exception("Undefined search type.");
    }
    notifyListeners();
  }

}