import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:picturesofdogs/services/dogloaderservice.dart';

part 'dog_browser_event.dart';
part 'dog_browser_state.dart';

class DogBrowserBloc extends Bloc<DogBrowserEvent, DogBrowserState> {
  final AssetsDogLoader _dogLoader;

  DogBrowserBloc(this._dogLoader) : super(DogBrowserInitial());

  @override
  Stream<DogBrowserState> mapEventToState(
    DogBrowserEvent event,
  ) async* {
    if (event is LoadDogsEvent) {
      final dogs = await _dogLoader.getDogs();
      yield DogsLoadedState(dogs);
    }
    // TODO: implement mapEventToState
  }
}
