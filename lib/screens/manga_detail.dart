import 'package:flutter/material.dart';
import 'package:myapp/screens/chapter.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Chapters'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDetailLayout(),
            _buildChapterLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Genre: $genre',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Rating: $rating',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildChapterLayout(BuildContext context) {
    return ListView.builder(
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Chapter ${index + 1}'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChapterScreen(
                  imageUrls: List.generate(
                    10, // Number of images
                    (imgIndex) => 'https://example.com/chapter${index + 1}_image${imgIndex + 1}.jpg',
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}