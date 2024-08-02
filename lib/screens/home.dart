import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/manga_section.dart';
import 'package:myapp/components/title_section.dart';
import 'package:myapp/screens/bookmark.dart';
import 'package:myapp/screens/genre.dart';
import 'package:myapp/screens/settings.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> topMangaItems = [
    {
      'imageUrl':
          'https://cover.komiku.id/wp-content/uploads/2024/08/A1-ATRI-My-Dear-Moments.jpg?resize=450,235&quality=60',
      'title': 'Top Manga 1',
      'category': 'Action',
    },
    {
      'imageUrl':
          'https://cover.komiku.id/wp-content/uploads/2024/08/A1-The-Young-Master-of-Namgung-Is-an-Impersonal-Person.png?resize=450,235&quality=60',
      'title': 'Top Manga 2',
      'category': 'Adventure',
    },
    {
      'imageUrl':
          'https://cover.komiku.id/wp-content/uploads/2024/08/A1-It-Turns-Out-That-Im-The-Demonic-Ancestor.jpg?resize=450,235&quality=60',
      'title': 'Top Manga 3',
      'category': 'Fantasy',
    },
    {
      'imageUrl':
          'https://cover.komiku.id/wp-content/uploads/2024/08/A1-We-Are-Not-Dating.png?resize=450,235&quality=60',
      'title': 'Top Manga 4',
      'category': 'Romance',
    },
    {
      'imageUrl':
          'https://cover.komiku.id/wp-content/uploads/2024/08/A1-Hijiri-kun-wa-Kiyoku-Ikitai-1.jpg?resize=450,235&quality=60',
      'title': 'Top Manga 5',
      'category': 'Horror',
    },
  ];

  final List<Widget> _pages = [
    HomeScreen(), // This is the current home screen
    GenreScreen(),
    BookmarkScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {});

    Navigator.of(context).pushReplacement(
      PageTransition(
        type: PageTransitionType.fade,
        child: _pages[index],
        duration: Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Manga Reader'),
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
                    return Card(
                      elevation: 8.0,
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              manga['imageUrl']!,
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
                                    manga['title']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Rating: ${manga['rating']}',
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
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SectionTitle(title: 'Trending'),
          const MangaSection(),
          const SectionTitle(title: 'Last Release'),
          const MangaSection(),
          const SectionTitle(title: 'Recommendations'),
          const MangaSection(),
        ],
      ),
    );
  }
}
