import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Favorite cards'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // PART 2: Create multiple FavoriteCard widgets
          FavoriteCard(title: 'Travel', description: 'Explore the world'),
          FavoriteCard(title: 'Skiing', description: 'Winter sports adventure'),
          FavoriteCard(title: 'Hiking', description: 'Mountain trails'),
        ],
      ),
    // );
    )
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavoriteCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  // Each card manages its own favorite status
  bool isFavorite = false;

  // Toggle favorite status when heart icon is clicked
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // PART 1: Layout - Container with border at bottom
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // PART 1: Expanded widget to spread the column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title text
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Description text
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    widget.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}