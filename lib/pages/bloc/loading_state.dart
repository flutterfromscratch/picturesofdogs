part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();
}

class LoadingInitial extends LoadingState {
  @override
  List<Object> get props => [];
}

class LoadingDogsState extends LoadingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DogsLoadedState extends LoadingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DogsLoadedErrorState extends LoadingState {
  final String errorText;

  DogsLoadedErrorState(this.errorText);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
