import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DogViewerPage extends StatelessWidget {
  final String name;
  final Uint8List imageBytes;

  const DogViewerPage({
    Key? key,
    required this.name,
    required this.imageBytes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: name,
              child: Image.memory(
                imageBytes,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(name)
        ],
      ),
    );
  }
}
