import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picturesofdogs/pages/dogsbrowser/viewer/bloc/dog_viewer_bloc.dart';
import 'package:picturesofdogs/services/dogloaderservice.dart';

class DogViewerPage extends StatefulWidget {
  final String name;
  final String assetPath;

  DogViewerPage({
    Key? key,
    required this.name,
    required this.assetPath,
  }) : super(key: key);

  @override
  _DogViewerPageState createState() => _DogViewerPageState();
}

class _DogViewerPageState extends State<DogViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Viewer'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider<DogViewerBloc>(
          create: (context) => DogViewerBloc(RepositoryProvider.of<AssetsDogLoader>(context))
            ..add(LoadDogEvent(
              widget.name,
              widget.assetPath,
            )),
          child: BlocBuilder<DogViewerBloc, DogViewerState>(
            builder: (context, state) {
              if (state is DogLoadedState) {
                return Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                      child: Image.asset(widget.assetPath),
                    ),
                    Text(widget.name)
                  ],
                );
              }
              if (state is DogErrorState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      shadowColor: Colors.red,
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text("Can't load ${state.dogName}")),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
