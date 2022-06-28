part of 'view_bloc.dart';

abstract class ViewState {}

class ViewInitState extends ViewState {}

class GotPokemonState extends ViewState {
  final List<Data> data;

  GotPokemonState(this.data);
}
