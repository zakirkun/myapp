import 'package:flutter/material.dart';
import 'package:myapp/components/manga_card.dart';

class MangaSection extends StatelessWidget {
  const MangaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of manga cards
        itemBuilder: (context, index) {
          return const MangaCard();
        },
      ),
    );
  }
}
