part of 'dog_viewer_bloc.dart';

abstract class DogViewerState extends Equatable {
  const DogViewerState();
}

class DogViewerInitial extends DogViewerState {
  @override
  List<Object> get props => [];
}

class DogLoadedState extends DogViewerState {
  final String dogName;

  DogLoadedState(this.dogName);

  @override
  // TODO: implement props
  List<Object?> get props => [this.dogName];
}
