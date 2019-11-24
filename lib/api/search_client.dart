import "package:http/http.dart" as http;
import "dart:convert";
import "package:dokode_flutter/repository/event_repository.dart";

String baseUrl = 'https://www.dokode.work/api/v1/';

class SearchClient {
  final String searchWord = '';

  Future<List<EventRepository>> search(String searchWord) async {
    String url = '${baseUrl}events?keyword=$searchWord';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<EventRepository> list = [];
      Map<String, dynamic> decoded = json.decode(response.body);
      for (var event in decoded['events']) {
        list.add(EventRepository.fromJson(event));
      }
      return list;
    } else {
      throw Exception('Fail to search repository');
    }
  }
}
