import 'dart:convert';
import 'package:vz_app/data/datasources/phrases_datasource.dart';

class PhrasesRepository {
  final datasource = PhrasesDatasource();

  Future<List> getPhrasesList({int number = 1}) async {
    final response = await datasource.getPhrases(number: number);

    final phrases = jsonDecode(response)["PHRASE"];

    return phrases;
  }
}
