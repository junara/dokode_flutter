import 'package:flutter/material.dart';
import "package:dokode_flutter/repository/event_repository.dart";
import "package:dokode_flutter/page/event_detail_page.dart";

class SearchPage extends StatelessWidget {
  SearchPage({@required this.events, @required this.handleSearch});

  final List<EventRepository> events;
  final Function handleSearch;
  final TextEditingController _controller = TextEditingController();

  void _handleSearch() {
    handleSearch(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSearch,
        tooltip: 'Search',
        child: Icon(Icons.search),
      ),
      body: Column(children: [
        Text('学会検索'),
        TextField(
          decoration: const InputDecoration(
            hintText: '医',
            labelText: 'キーワード',
          ),
          maxLines: 1,
          controller: _controller,
        ),
        Flexible(child: _buildEventList(context))
      ]),
    );
  }

  Widget _buildEventList(BuildContext context) {
    if (events.length == 0) {
      return Container();
    }
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = events[index];
          return _buildCard(event, context);
        });
  }

  Widget _buildCard(EventRepository event, BuildContext context) {
    return Card(
        child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return EventDetailPage(event);
              }));
            },
            child: ListTile(
              leading: Image.network(event.thumbnailSmall),
              title: Text(event.name),
              subtitle: Text(event.venueName),
              trailing: Icon(Icons.arrow_forward_ios),
            )));
  }
}
