import 'package:flutter/material.dart';

class SavedImages extends StatelessWidget {
  const SavedImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF043A52),
      appBar: AppBar(
        title: Text('Gallery'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(),
    );
  }
}
