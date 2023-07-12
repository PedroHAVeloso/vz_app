import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vz_app/data/repositories/phrases_repository.dart';

part 'phrases_state.dart';

class PhrasesCubit extends Cubit<PhrasesState> {
  PhrasesCubit() : super(PhrasesInitial());

  PhrasesRepository repository = PhrasesRepository();

  List _phrases = [];
  final List _favorites = [];

  void getPhrases({required int number}) async {
    emit(PhrasesLoading());
    
    _phrases = await repository.getPhrasesList(number: number);
    _favorites.clear();

    // ignore: unused_local_variable
    for (var phrase in _phrases) {
      _favorites.add(false);
    }

    emit(PhrasesLoaded(phrases: _phrases, favorites: _favorites));
  }

  void favoritePhrase({required int itemId}) async {
    _favorites[itemId] = true;
    emit(PhrasesLoaded(phrases: _phrases, favorites: _favorites));
  }

  void clearPhrases() {
    _favorites.clear();
    emit(PhrasesInitial());
  }
}
