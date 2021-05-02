import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picturesofdogs/pages/dogsbrowser/browser/bloc/dog_browser_bloc.dart';
import 'package:picturesofdogs/pages/dogsbrowser/viewer/dogviewer.dart';
import 'package:picturesofdogs/services/dogloaderservice.dart';

class DogBrowserWidget extends StatefulWidget {
  @override
  _DogBrowserWidgetState createState() => _DogBrowserWidgetState();
}

class _DogBrowserWidgetState extends State<DogBrowserWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogBrowserBloc(RepositoryProvider.of<AssetsDogLoader>(context))
        ..add(
          LoadDogsEvent(),
        ),
      child: BlocBuilder<DogBrowserBloc, DogBrowserState>(
        builder: (context, state) {
          if (state is DogsLoadedState) {
            return GridView.count(
              // shrinkWrap: true,
              crossAxisCount: (MediaQuery.of(context).size.width / 180).round().clamp(1, 5),
              children: state.dogs
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DogViewerPage(name: e.name, imageBytes: e.dogBytes),
                          ),
                        );
                      },
                      child: Card(
                        child: Hero(
                          tag: e.name,
                          child: Image.memory(
                            e.dogBytes,
                            // color: Colors.black,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
