import 'package:flutter/material.dart';
import 'package:myapp/models/manga.dart';
import 'package:myapp/screens/manga_detail.dart';

class GenreScreen extends StatelessWidget {
  final String genre;

  GenreScreen({
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    // Define manga items for the genre (replace with actual data)
    final List<Manga> genreMangaItems = List.generate(
      10,
      (index) => Manga(
        imageUrl: 'https://example.com/genre${genre}_image${index + 1}.jpg',
        title: '$genre Manga ${index + 1}',
        rating: '${4.0 + (index % 2)}/5',
      ),
    );

    final genreModel = Genre.fromMap(
      genre,
      genreMangaItems
          .map((manga) => {
                'imageUrl': manga.imageUrl,
                'title': manga.title,
                'rating': manga.rating,
              })
          .toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${genreModel.name} Manga'),
      ),
      body: ListView.builder(
        itemCount: genreModel.mangas.length,
        itemBuilder: (context, index) {
          final manga = genreModel.mangas[index];
          return ListTile(
            leading: Image.network(manga.imageUrl,
                width: 50, height: 75, fit: BoxFit.cover),
            title: Text(manga.title),
            subtitle: Text('Rating: ${manga.rating}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MangaDetailScreen(
                    title: manga.title,
                    genre: genre,
                    description: 'Description for ${manga.title}',
                    rating: manga.rating,
                    imageUrl: manga.imageUrl,
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
