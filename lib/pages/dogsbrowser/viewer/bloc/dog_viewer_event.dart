part of 'dog_viewer_bloc.dart';

abstract class DogViewerEvent extends Equatable {
  const DogViewerEvent();
}

class LoadDogEvent extends DogViewerEvent {
  final String dogName;

  LoadDogEvent(this.dogName);

  @override
  // TODO: implement props
  List<Object?> get props => [dogName];
}
