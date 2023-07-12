import 'package:hive/hive.dart';

class FavoritedPhrasesDatasource {
  Future<Map> getPhrases() async {
    final box = Hive.box('phrases');

    return box.toMap();
  }

  Future<void> favoritePhrase({required String phrase}) async {
    final box = Hive.box('phrases');
    await box.add(phrase);
  }

  Future<void> unFavoritePhrase({required int key}) async {
    final box = Hive.box('phrases');
    await box.delete(key);
  }
}
