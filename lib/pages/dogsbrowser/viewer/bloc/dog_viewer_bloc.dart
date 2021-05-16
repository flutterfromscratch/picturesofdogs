import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:picturesofdogs/services/dogloaderservice.dart';

part 'dog_viewer_event.dart';
part 'dog_viewer_state.dart';

class DogViewerBloc extends Bloc<DogViewerEvent, DogViewerState> {
  final AssetsDogLoader _dogLoader;

  DogViewerBloc(this._dogLoader) : super(DogViewerInitial());

  @override
  Stream<DogViewerState> mapEventToState(
    DogViewerEvent event,
  ) async* {
    if (event is LoadDogEvent) {
      try {
        if (event.dogName == "Dog 3") throw Exception("Can't load that dog.");

        final dog = await _dogLoader.getDog(event.dogName);
        yield DogLoadedState(dog.name, dog.assetPath);
      } on Exception catch (ex) {
        yield DogErrorState(event.dogName);
      }

      // yield DogLoadedState(event.dogName, event.dogAssetPath);
    }
    // TODO: implement mapEventToState
  }
}
