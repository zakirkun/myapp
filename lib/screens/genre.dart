import 'package:flutter/material.dart';
import 'package:myapp/screens/manga_detail.dart';

class GenreScreen extends StatelessWidget {
  final String genre;

  GenreScreen({
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    // Replace this with actual data fetching based on genre
    final List<Map<String, String?>> genreMangaItems = List.generate(
      10,
      (index) => {
        'imageUrl': 'https://example.com/genre${genre}_image${index + 1}.jpg',
        'title': '$genre Manga ${index + 1}',
        'rating': '${4.0 + (index % 2)}/5',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('$genre Manga'),
      ),
      body: ListView.builder(
        itemCount: genreMangaItems.length,
        itemBuilder: (context, index) {
          final manga = genreMangaItems[index];
          final imageUrl = manga['imageUrl'] ??
              'default_image_url.jpg'; // Use a default value if null
          final title = manga['title'] ?? 'Unknown Title';
          final rating = manga['rating'] ?? 'No Rating';

          return ListTile(
            leading: Image.network(imageUrl,
                width: 50, height: 75, fit: BoxFit.cover),
            title: Text(title),
            subtitle: Text('Rating: $rating'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MangaDetailScreen(
                    title: title,
                    genre: genre,
                    description: 'Description for $title',
                    rating: rating,
                    imageUrl: imageUrl,
                    chapters:
                        List.generate(10, (index) => 'Chapter ${index + 1}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
