import 'package:flutter/material.dart';
import 'package:myapp/models/bookmark.dart';
import 'package:myapp/provider/provider.dart';
import 'package:myapp/screens/chapter.dart';
import 'package:provider/provider.dart';

class MangaDetailScreen extends StatelessWidget {
  final String title;
  final String genre;
  final String description;
  final String rating;
  final String imageUrl;
  final List<String> chapters;

  MangaDetailScreen({
    required this.title,
    required this.genre,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final bookmark = Bookmark(
      imageUrl: imageUrl,
      title: title,
      rating: rating,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              bookmarkProvider.isBookmarked(bookmark)
                  ? Icons.bookmark
                  : Icons.bookmark_border,
            ),
            onPressed: () {
              if (bookmarkProvider.isBookmarked(bookmark)) {
                bookmarkProvider.removeBookmark(bookmark);
              } else {
                bookmarkProvider.addBookmark(bookmark);
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Genre: $genre\nDescription: $description\nRating: $rating',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chapters[index]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChapterScreen(
                          chapter: chapters[index],
                          imageUrls: [],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
