import 'package:vz_app/data/datasources/favorited_phrases_datasource.dart';

class FavoritedPhrasesRepository {
  final datasource = FavoritedPhrasesDatasource();

  Future<Map> fetchAllPhrases() async {
    final phrases = await datasource.getPhrases();

    return phrases;
  }

  Future<void> favoritePhrase({required String phrase}) async {
    await datasource.favoritePhrase(phrase: phrase);
  }

  Future<void> unFavoritePhrase({required int key}) async {
    await datasource.unFavoritePhrase(key: key);
  }
}
