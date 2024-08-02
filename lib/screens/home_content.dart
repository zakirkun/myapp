import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/components/manga_section.dart';
import 'package:myapp/components/title_section.dart';
import 'package:myapp/models/manga.dart';
import 'package:myapp/screens/genre.dart';
import 'package:myapp/screens/manga_detail.dart';

class HomeScreenContent extends StatelessWidget {
  final List<Manga> topMangaItems = [
    Manga(
      imageUrl: 'https://example.com/top_image1.jpg',
      title: 'Top Manga 1',
      rating: '4.5/5',
    ),
    // Add more Manga items as needed
  ];

  final List<String> categories = [
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Thriller',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manga Reader'),
      ),
      body: ListView(
        children: [
          // Swiper (Carousel) for Top 5 Manga
          Container(
            padding: EdgeInsets.all(8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
              ),
              items: topMangaItems.map((manga) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MangaDetailScreen(
                              title: manga.title,
                              genre: 'Action', // Replace with actual genre
                              description:
                                  'Description for ${manga.title}', // Replace with actual description
                              rating: manga.rating,
                              imageUrl: manga.imageUrl,
                              chapters: List.generate(
                                  10, (index) => 'Chapter ${index + 1}'),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 8.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                manga.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      manga.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Rating: ${manga.rating}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // Categories Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  height: 100, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GenreScreen(
                                genre: category,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5.0,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: 120, // Adjust width as needed
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                category,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Other sections like Trending, Last Release, Recommendations
          SectionTitle(title: 'Trending'),
          MangaSection(),
          SectionTitle(title: 'Last Release'),
          MangaSection(),
          SectionTitle(title: 'Recommendations'),
          MangaSection(),
        ],
      ),
    );
  }
}
