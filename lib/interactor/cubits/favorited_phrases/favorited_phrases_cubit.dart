import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vz_app/data/repositories/favorited_phrases_repository.dart';

part 'favorited_phrases_state.dart';

class FavoritedPhrasesCubit extends Cubit<FavoritedPhrasesState> {
  FavoritedPhrasesCubit() : super(FavoritedPhrasesInitial()) {
    getPhrases();
  }

  FavoritedPhrasesRepository repository = FavoritedPhrasesRepository();

  Map _phrases = {};

  void getPhrases() async {
    emit(FavoritedPhrasesLoading());
    _phrases = await repository.fetchAllPhrases();

    if (_phrases.isEmpty) {
      emit(FavoritedPhrasesInitial());
    } else {
      emit(FavoritedPhrasesLoaded(phrases: _phrases));
    }
  }

  void favoritePhrase({required String phrase}) async {
    await repository.favoritePhrase(phrase: phrase);
    getPhrases();
  }

  void unFavoritePhrase({required int key}) async {
    await repository.unFavoritePhrase(key: key);
    getPhrases();
  }
}
