part of 'dog_viewer_bloc.dart';

abstract class DogViewerEvent extends Equatable {
  const DogViewerEvent();
}

class LoadDogEvent extends DogViewerEvent {
  final String dogName;
  final String dogAssetPath;

  LoadDogEvent(this.dogName, this.dogAssetPath);

  @override
  // TODO: implement props
  List<Object?> get props => [dogName, dogAssetPath];
}
