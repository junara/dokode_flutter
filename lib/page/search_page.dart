import "dart:async";
import 'package:flutter/material.dart';
import "package:dokode_flutter/repository/event_repository.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:dokode_flutter/page/event_detail_page.dart";

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<EventRepository> _events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _searchRepositories('tet').then((events) {
            setState(() {
              _events = events;
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body:
          Column(children: [Text('学会検索'), Flexible(child: _buildEventList())]),
    );
  }

  Widget _buildEventList() {
    if (_events.length == 0) {
      return Container();
    }
    return ListView.builder(
        itemCount: _events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = _events[index];
          return _buildCard(event);
        });
  }

  Widget _buildCard(EventRepository event) {
    return Card(
        child: FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EventDetailPage(event);
              }));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Column(children: [
                    Text(event.name),
                    Text(event.displayStartAt),
                    Text(event.venueName),
                    Text(event.url != null ? event.url : ''),
                  ])),
                  Image.network(
                    event.thumbnailSmall,
                  ),
                ])));
  }
}

Future<List<EventRepository>> _searchRepositories(String searchWord) async {
  final response = await http.get('https://www.dokode.work/api/v1/events');
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
