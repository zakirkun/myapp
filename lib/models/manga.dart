class Manga {
  final String imageUrl;
  final String title;
  final String rating;

  Manga({
    required this.imageUrl,
    required this.title,
    required this.rating,
  });

  // Factory method to create a Manga object from a map
  factory Manga.fromMap(Map<String, String> map) {
    return Manga(
      imageUrl: map['imageUrl']!,
      title: map['title']!,
      rating: map['rating']!,
    );
  }
}

class Genre {
  final String name;
  final List<Manga> mangas;

  Genre({
    required this.name,
    required this.mangas,
  });

  // Factory method to create a Genre object from a map
  factory Genre.fromMap(String name, List<Map<String, String>> mangaMaps) {
    final mangas = mangaMaps.map((map) => Manga.fromMap(map)).toList();
    return Genre(name: name, mangas: mangas);
  }
}
