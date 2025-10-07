import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Image Viewer', home: ImageViewer());
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Viewer')),
      body: Center(
        child: Image.asset('assets/image.heic', fit: BoxFit.contain),
      ),
    );
  }
}
