import 'package:flutter/material.dart';
import 'package:image_downloader_app/home_screen.dart';

void main() {
  runApp(const ImageApp());
}

class ImageApp extends StatelessWidget {
  const ImageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Image Downloader',
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: HomeScreen(),
      ),
    );
  }
}
