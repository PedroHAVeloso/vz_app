import 'package:http/http.dart' as http;

class PhrasesDatasource {
  Future<String> getPhrases({required int number}) async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/phrases/$number"),
    );

    return response.body;
  }
}
