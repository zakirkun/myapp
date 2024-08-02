import 'package:flutter/material.dart';
import 'package:myapp/provider/provider.dart';
import 'package:myapp/screens/manga_detail.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: bookmarkProvider.bookmarks.isEmpty
          ? Center(child: Text('No bookmarks yet'))
          : ListView.builder(
              itemCount: bookmarkProvider.bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarkProvider.bookmarks[index];
                return Dismissible(
                  key: Key(bookmark.title), // Use a unique key for each item
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    bookmarkProvider.removeBookmark(bookmark);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${bookmark.title} removed from bookmarks'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      bookmark.imageUrl,
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    title: Text(bookmark.title),
                    subtitle: Text('Rating: ${bookmark.rating}'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MangaDetailScreen(
                            title: bookmark.title,
                            genre:
                                'Genre', // Replace with actual genre if available
                            description:
                                'Description for ${bookmark.title}', // Replace with actual description if available
                            rating: bookmark.rating,
                            imageUrl: bookmark.imageUrl,
                            chapters: List.generate(
                                10, (index) => 'Chapter ${index + 1}'),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
