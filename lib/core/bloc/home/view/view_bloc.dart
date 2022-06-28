import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:application/core/models/pokemon.dart';
import 'package:application/core/repositories/pokemon_repository.dart';

part 'view_event.dart';
part 'view_state.dart';

class ViewBloc extends Bloc<ViewEvent, ViewState> {
  ViewBloc() : super(ViewInitState());

  String query = '';
  final PokemonRepository _repository = PokemonRepository();
  late List<Data> _list;

  @override
  Stream<ViewState> mapEventToState(ViewEvent event) async* {
    if (event is FetchPokemonEvent) {
      _list = await _repository.fetchPokemon(query);
      yield GotPokemonState(_list);
    }
  }
}
