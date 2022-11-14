import 'package:test_app/models/creator.dart';
import 'package:test_app/models/album.dart';

class Artist extends Creator{

  final List<Album> albums;

  Artist({this.albums = const [], required super.name, required super.image});
}