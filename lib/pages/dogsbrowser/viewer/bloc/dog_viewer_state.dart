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
  final String assetPath;

  DogLoadedState(this.dogName, this.assetPath);

  @override
  // TODO: implement props
  List<Object?> get props => [this.dogName, this.assetPath];
}

class DogErrorState extends DogViewerState {
  final String dogName;

  DogErrorState(this.dogName);

  @override
  // TODO: implement props
  List<Object?> get props => [dogName];
}
