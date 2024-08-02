import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  const MangaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://cdn.gramedia.com/uploads/picture_meta/2023/5/28/nqza8hk7weshv37aqst65q.jpg",
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Manga Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Category'),
          ),
        ],
      ),
    );
  }
}
