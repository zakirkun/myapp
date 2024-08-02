import 'package:flutter/material.dart';

class ChapterScreen extends StatelessWidget {
  final List<String> imageUrls;

  ChapterScreen({
    required this.imageUrls, required String chapter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter Content'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
