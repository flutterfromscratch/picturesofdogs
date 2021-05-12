import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
  late ScrollController _controller;
  bool pastHalfway = true;
  bool imageScrollBreakpoint = true;
  bool scrolling = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController()
      ..addListener(() {
        setState(() {
          imageScrollBreakpoint = _controller.offset / _controller.position.maxScrollExtent < 0.2;
          pastHalfway = _controller.offset / _controller.position.maxScrollExtent < 0.5;
          // print(pastHalfway);
        });
        // print(_controller.offset);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Viewer"),
      ),
      body: Stack(
        children: [
          Hero(
            tag: widget.name,
            child: Material(
              child: Stack(
                alignment: Alignment.center,
                // fit: StackFit.loose,
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Colors.green.withOpacity(0.8),
                      image: DecorationImage(
                        // colorFilter: ,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),

                        // colorFilter: ColorFilter.matrix(ColorFilterGenerator),
                        image: MemoryImage(widget.imageBytes),
                      ),
                    ),
                    // color: Colors.blue,
                  ),
                  AnimatedPadding(
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: 500),
                    padding: imageScrollBreakpoint ? EdgeInsets.all(10) : EdgeInsets.fromLTRB(10, 10, 10, MediaQuery.of(context).size.height * 0.6),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // borderRadius: BorderRadius.circular(30),
                      child: Image.memory(
                        widget.imageBytes,
                        // height: MediaQuery.of(context).size.height - 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    controller: _controller,
                    // primary: ,
                    // dragStartBehavior: DragStartBehavior.start,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                            child: Container(
                              // foregroundDecoration: ,
                              child: Column(children: [
                                Text(
                                  widget.name,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                                AnimatedOpacity(
                                  opacity: imageScrollBreakpoint ? 0.0 : 1.0,
                                  duration: Duration(milliseconds: 400),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          5,
                                          (index) => index < 4
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 50,
                                                  color: Theme.of(context).colorScheme.primary,
                                                )
                                              : Icon(
                                                  Icons.favorite_border,
                                                  size: 50,
                                                  color: Theme.of(context).colorScheme.primaryVariant,
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(width: 5, color: Theme.of(context).colorScheme.background),
                                // shape: ,
                                // borderRadius: ,
                                color: Theme.of(context).colorScheme.primary.withAlpha(30),
                                // backgroundBlendMode: BlendMode.luminosity,
                              ),
                              // height: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onVerticalDragEnd: (drag) {
                      print('panning');
                      if (pastHalfway) {
                        _controller.animateTo(_controller.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                      } else {
                        _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
