import 'package:flutter/material.dart';
import 'package:myapp/models/bookmark.dart';

class BookmarkProvider with ChangeNotifier {
  final List<Bookmark> _bookmarks = [];

  List<Bookmark> get bookmarks => _bookmarks;

  void addBookmark(Bookmark bookmark) {
    _bookmarks.add(bookmark);
    notifyListeners();
  }

  void removeBookmark(Bookmark bookmark) {
    _bookmarks.remove(bookmark);
    notifyListeners();
  }

  bool isBookmarked(Bookmark bookmark) {
    return _bookmarks.contains(bookmark);
  }
}
