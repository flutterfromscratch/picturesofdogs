import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class DogViewerPage extends StatefulWidget {
  final String name;
  final Uint8List imageBytes;

  DogViewerPage({
    Key? key,
    required this.name,
    required this.imageBytes,
  }) : super(key: key);

  @override
  _DogViewerPageState createState() => _DogViewerPageState();
}

class _DogViewerPageState extends State<DogViewerPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
