part of 'dog_browser_bloc.dart';

abstract class DogBrowserState extends Equatable {
  const DogBrowserState();
}

class DogBrowserInitial extends DogBrowserState {
  @override
  List<Object> get props => [];
}

class DogsLoadedState extends DogBrowserState {
  final List<Dog> dogs;

  DogsLoadedState(this.dogs);

  @override
  // TODO: implement props
  List<Object?> get props => [dogs];
}
