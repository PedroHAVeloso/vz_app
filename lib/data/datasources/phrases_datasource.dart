import 'package:http/http.dart' as http;

class PhrasesDatasource {
  static const String apiUrl = "http://10.0.2.2:8080";

  Future<String> getPhrases({required int number}) async {
    final response = await http.get(
      Uri.parse("$apiUrl/phrases/$number"),
    );

    return response.body;
  }
}
