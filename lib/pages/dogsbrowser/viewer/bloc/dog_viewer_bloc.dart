import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dog_viewer_event.dart';
part 'dog_viewer_state.dart';

class DogViewerBloc extends Bloc<DogViewerEvent, DogViewerState> {
  DogViewerBloc() : super(DogViewerInitial());

  @override
  Stream<DogViewerState> mapEventToState(
    DogViewerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
