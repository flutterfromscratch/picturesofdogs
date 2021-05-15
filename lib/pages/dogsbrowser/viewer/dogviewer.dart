import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picturesofdogs/pages/dogsbrowser/viewer/bloc/dog_viewer_bloc.dart';

class DogViewerPage extends StatefulWidget {
  final String name;

  DogViewerPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _DogViewerPageState createState() => _DogViewerPageState();
}

class _DogViewerPageState extends State<DogViewerPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider<DogViewerBloc>(
        create: (context) => DogViewerBloc()..add(LoadDogEvent(widget.name)),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Image.asset(widget.name),
            ),
            Text(widget.name)
          ],
        ),
      ),
    );
  }
}
