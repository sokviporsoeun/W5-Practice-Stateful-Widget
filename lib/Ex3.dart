import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      debugShowCheckedModeBanner: false,
      home: const ImageGallery(),
    );
  }
}
class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentImageIndex = 0;

  final List<String> images = [
    'assets/w4-s2/Cat.jpg',
    'assets/w4-s2/fish.jpg',
    'assets/w4-s2/tiger.jpg',
    'assets/w4-s2/orange.jpg',
    
  ];
  void goToPrevious() {
    setState(() {

      if (currentImageIndex == 0) {
        currentImageIndex = images.length - 1;
      } else {
        currentImageIndex--;
      }
    });
  }

  void goToNext() {
    setState(() {

      if (currentImageIndex == images.length - 1) {
        currentImageIndex = 0;
      } else {
        currentImageIndex++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: [
          IconButton(
            onPressed: goToPrevious,
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Go to previous image',
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: goToNext,
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: 'Go to next image',
          ),
        ],
      ),
        body: Image.asset(images[currentImageIndex]),
    );
  }
}