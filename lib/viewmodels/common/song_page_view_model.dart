import 'package:flutter/material.dart';
import 'package:test_app/models/song.dart';

class SongPageViewModel with ChangeNotifier {
  Song song;
  
  SongPageViewModel(this.song);
}