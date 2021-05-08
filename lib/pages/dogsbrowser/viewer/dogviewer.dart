import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/gestures.dart';
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
      body: Stack(
        children: [
          Hero(
            tag: name,
            child: Material(
              child: Stack(
                // alignment: Alignment.bottomCenter,
                // fit: StackFit.expand,
                children: [
                  Image.memory(
                    imageBytes,
                    height: MediaQuery.of(context).size.height - 100,
                    fit: BoxFit.fitHeight,
                  ),
                  SingleChildScrollView(
                      // primary: ,
                      // dragStartBehavior: DragStartBehavior.start,
                      child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 100,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                          child: Container(
                            child: Center(
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 30,
                                      color: Colors.white.withAlpha(200),
                                    ),
                              ),
                            ),
                            height: 500,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withAlpha(30),
                              // backgroundBlendMode: BlendMode.luminosity,
                            ),
                            // height: 50,
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
