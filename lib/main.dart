import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'photos/presentation/pages/photos_page.dart';

void main() {
  runApp(const AwesomeApp());
}

class AwesomeApp extends StatelessWidget {
  const AwesomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      home: PhotosPage(),
    );
  }
}
